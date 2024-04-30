import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'package:casino_scraping/src/models/content.dart';
import 'package:casino_scraping/src/models/information.dart';
import 'package:casino_scraping/src/models/jackpot_detail.dart';
import 'package:dio/dio.dart';

void main(List<String> arguments) async {
  final Dio dio = Dio();
  final String _url =
      'https://www.casinolistings.com/jackpots/microgaming/wow-pot-jackpot?j=1596';

  final result = await dio.get(_url);
  final bs = BeautifulSoup(result.data);

  final factData = bs.find('div', attrs: {'class': 'nodeintro'})?.find('p');
  final spans = factData
          ?.findAll('span')
          .where((element) =>
              element.className == 'usd' ||
              element.className == 'eur' ||
              element.className == 'gbp')
          .toList() ??
      [];

  String fact = factData?.text ?? '';

  if (spans.length > 1) {
    spans.removeAt(0);
    for (var span in spans) {
      fact = fact.replaceFirst(span.text, '');
    }
  }

  final informationData =
      bs.find('div', attrs: {'id': 'review-sidebar'})?.findAll('li');

  final List<Information> informationList = [];

  for (Bs4Element data in informationData ?? []) {
    final hasH4 = data.find('h4') != null;
    if (!hasH4) {
      continue;
    }

    final title = data.find('h4')?.text ?? '';

    final List<Content> contents = [];

    final contentsData = data.findAll('tr');
    for (var contentData in contentsData) {
      final keyData = contentData.find('td');
      final contentTitle = (keyData?.find('span') ?? keyData)?.text ?? '';
      final description =
          keyData?.find('div', attrs: {'class': 'description'})?.text;
      final valueData = contentData.find('td', attrs: {'class': 'number'});
      final value = (valueData?.find('span') ?? valueData)?.text ?? '';

      print('key: $contentTitle - description: $description - value: $value');

      final content = Content(
        title: contentTitle,
        description: description,
        value: value,
      );
      contents.add(content);
    }

    final information = Information(
      title: title,
      contents: contents,
    );
    informationList.add(information);
  }

  final descriptionData =
      bs.find('div', attrs: {'class': 'detail'})?.findAll('p');
  final descriptions = descriptionData?.map((e) => e.text).toList() ?? [];

  final jackpotDetail = JackpotDetail(
    fact: fact,
    informationList: informationList,
    descriptions: descriptions,
  );

  print(jackpotDetail);
}
