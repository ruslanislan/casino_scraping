import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'package:dio/dio.dart';

import 'models/models.dart';

class JackpotService {
  final Dio dio = Dio();
  static const _allJackpotsUrl =
      'https://www.casinolistings.com/jackpots/progressives';
  static const _topJackpotsUrl = 'https://www.casinolistings.com/jackpots';
  static const _recentJackpotsUrl =
      'https://www.casinolistings.com/jackpots/recent-wins';
  static const _breakEvenJackpotsUrl =
      'https://www.casinolistings.com/jackpots/break-even-values';
  static const _biggestJackpotsUrl =
      'https://www.casinolistings.com/jackpots/biggest-wins';
  static const _url = 'https://www.casinolistings.com';

  Future<List<Jackpot>> getAllJackpots() async {
    final result = await dio.get(_allJackpotsUrl);
    final bs = BeautifulSoup(result.data);

    final jackpotsData = bs
            .find('table', attrs: {'class': 'jackpots lister'})
            ?.findAll('tr')
            .where((element) =>
                element.className == 'even' || element.className == 'odd')
            .toList() ??
        [];

    final List<Jackpot> jackpots = [];
    for (var data in jackpotsData) {
      final name = data.find('td', attrs: {'class': 'name'})?.text;
      final value = data.find('td', attrs: {'class': 'number jackpot'})?.text;
      final software = data.find('td', attrs: {'class': 'software'})?.text;
      final url = data
          .find('td', attrs: {'class': 'name'})
          ?.find('a')
          ?.attributes['href'];

      final jackpot = Jackpot(
        name: name ?? '',
        value: value ?? '',
        software: software ?? '',
        url: url ?? '',
        breakEven: '',
        rtp: '',
        winChance: '',
      );

      jackpots.add(jackpot);
    }
    return jackpots;
  }

  Future<(List<Jackpot> topWorldWideJackpots, List<Jackpot> topUsaJackpots)>
      getTopJackpots() async {
    final result = await dio.get(_topJackpotsUrl);
    final bs = BeautifulSoup(result.data);

    final topWorldWideJackpotsData = bs
            .find('div', attrs: {'id': 'top10-jackpots-tab'})
            ?.findAll('tr')
            .where((element) =>
                element.className == 'even' || element.className == 'odd')
            .toList() ??
        [];

    final List<Jackpot> topWorldWideJackpots = [];
    for (var data in topWorldWideJackpotsData) {
      final name = data.find('td', attrs: {'class': 'name'})?.text;
      final value = data
          .find('td', attrs: {'class': 'number jackpot active'})
          ?.find('span')
          ?.text;
      final software = data.find('td', attrs: {'class': 'software'})?.text;
      final url = data
          .find('td', attrs: {'class': 'name'})
          ?.find('a')
          ?.attributes['href'];

      final jackpot = Jackpot(
        name: name ?? '',
        value: value ?? '',
        software: software ?? '',
        url: url ?? '',
        breakEven: '',
        rtp: '',
        winChance: '',
      );

      topWorldWideJackpots.add(jackpot);
    }

    final topUSAJackpotsData = bs
            .find('div', attrs: {'id': 'top10-jackpots-usa-tab'})
            ?.findAll('tr')
            .where((element) =>
                element.className == 'even' || element.className == 'odd')
            .toList() ??
        [];

    final List<Jackpot> topUSAJackpots = [];
    for (var data in topUSAJackpotsData) {
      final name = data.find('td', attrs: {'class': 'name'})?.text;
      final value = data
          .find('td', attrs: {'class': 'number jackpot active'})
          ?.find('span')
          ?.text;
      final software = data.find('td', attrs: {'class': 'software'})?.text;
      final url = data
          .find('td', attrs: {'class': 'name'})
          ?.find('a')
          ?.attributes['href'];

      final jackpot = Jackpot(
        name: name ?? '',
        value: value ?? '',
        software: software ?? '',
        url: url ?? '',
        breakEven: '',
        rtp: '',
        winChance: '',
      );

      topUSAJackpots.add(jackpot);
    }

    return (topWorldWideJackpots, topUSAJackpots);
  }

  Future<List<Jackpot>> getRecentJackpots() async {
    final result = await dio.get(_recentJackpotsUrl);
    final bs = BeautifulSoup(result.data);

    final recentJackpotsData = bs
            .find('table', attrs: {'id': 'jackpots-wins'})
            ?.findAll('tr')
            .where((element) =>
                element.className == 'even' || element.className == 'odd')
            .toList() ??
        [];

    final List<Jackpot> jackpots = [];
    for (var data in recentJackpotsData) {
      final name = data.find('td', attrs: {'class': 'name'})?.text;
      final value = data
          .find('td', attrs: {'class': 'number jackpot'})
          ?.find('span')
          ?.text;
      final software = data.find('td', attrs: {'class': 'software'})?.text;
      final url = data
          .find('td', attrs: {'class': 'name'})
          ?.find('a')
          ?.attributes['href'];

      final jackpot = Jackpot(
        name: name ?? '',
        value: value ?? '',
        software: software ?? '',
        url: url ?? '',
        breakEven: '',
        rtp: '',
        winChance: '',
      );

      jackpots.add(jackpot);
    }

    return jackpots;
  }

  Future<List<Jackpot>> getBreakEvenJackpots() async {
    final result = await dio.get(_breakEvenJackpotsUrl);
    final bs = BeautifulSoup(result.data);

    final breakEvenJackpotsData = bs
            .find('table', attrs: {'class': 'jackpots lister'})
            ?.findAll('tr')
            .where((element) =>
                element.className == 'even' || element.className == 'odd')
            .toList() ??
        [];

    final List<Jackpot> jackpots = [];
    for (var data in breakEvenJackpotsData) {
      final name = data.find('td', attrs: {'class': 'name'})?.find('a')?.text;
      final value = data
          .find('td', attrs: {'class': 'number jackpot'})
          ?.find('span')
          ?.text;
      final software =
          data.find('td', attrs: {'class': 'name'})?.find('div')?.text;
      final url = data
          .find('td', attrs: {'class': 'name'})
          ?.find('a')
          ?.attributes['href'];
      final breakEven = data
          .find('td', attrs: {'class': 'number breakeven'})
          ?.find('span')
          ?.text;
      final rtp = data.find('td', attrs: {'class': 'number rtp'})?.text;
      final winChance =
          data.find('td', attrs: {'class': 'number winchance'})?.text;

      final jackpot = Jackpot(
        name: name ?? '',
        value: value ?? '',
        software: software ?? '',
        url: url ?? '',
        breakEven: breakEven ?? '',
        rtp: rtp ?? '',
        winChance: winChance ?? '',
      );

      jackpots.add(jackpot);
    }

    return jackpots;
  }

  Future<List<Jackpot>> getBiggestJackpots() async {
    final result = await dio.get(_biggestJackpotsUrl);
    final bs = BeautifulSoup(result.data);

    final biggestJackpotsData = bs
            .find('table', attrs: {'id': 'jackpots-wins'})
            ?.findAll('tr')
            .where((element) =>
                element.className == 'even' || element.className == 'odd')
            .toList() ??
        [];

    final List<Jackpot> jackpots = [];
    for (var data in biggestJackpotsData) {
      final name = data.find('td', attrs: {'class': 'name'})?.find('a')?.text;
      final value = data
          .find('td', attrs: {'class': 'number jackpot'})
          ?.find('span')
          ?.text;

      final jackpot = Jackpot(
        name: name ?? '',
        value: value ?? '',
        software: '',
        url: '',
        breakEven: '',
        rtp: '',
        winChance: '',
      );

      jackpots.add(jackpot);
    }
    return jackpots;
  }

  Future<JackpotDetail> getJackpotDetail(String subUrl) async {
    final result = await dio.get(_url + subUrl);
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

    return jackpotDetail;
  }
}
