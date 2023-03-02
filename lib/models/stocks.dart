class StocksQuotes {
  StocksQuotes({
    required this.declines,
    required this.data,
    required this.trdVolumesum,
    required this.latestData,
    required this.advances,
    required this.unchanged,
    required this.trdValueSumMil,
    required this.time,
    required this.trdVolumesumMil,
    required this.trdValueSum,
  });
  late final int declines;
  late final List<Data> data;
  late final String trdVolumesum;
  late final List<LatestData> latestData;
  late final int advances;
  late final int unchanged;
  late final String trdValueSumMil;
  late final String time;
  late final String trdVolumesumMil;
  late final String trdValueSum;
  
  StocksQuotes.fromJson(Map<String, dynamic> json){
    declines = json['declines'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
    trdVolumesum = json['trdVolumesum'];
    latestData = List.from(json['latestData']).map((e)=>LatestData.fromJson(e)).toList();
    advances = json['advances'];
    unchanged = json['unchanged'];
    trdValueSumMil = json['trdValueSumMil'];
    time = json['time'];
    trdVolumesumMil = json['trdVolumesumMil'];
    trdValueSum = json['trdValueSum'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['declines'] = declines;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    _data['trdVolumesum'] = trdVolumesum;
    _data['latestData'] = latestData.map((e)=>e.toJson()).toList();
    _data['advances'] = advances;
    _data['unchanged'] = unchanged;
    _data['trdValueSumMil'] = trdValueSumMil;
    _data['time'] = time;
    _data['trdVolumesumMil'] = trdVolumesumMil;
    _data['trdValueSum'] = trdValueSum;
    return _data;
  }
}

class Data {
  Data({
    required this.symbol,
    required this.open,
    required this.high,
    required this.low,
    required this.ltP,
    required this.ptsC,
    required this.per,
    required this.trdVol,
    required this.trdVolM,
    required this.ntP,
    required this.mVal,
    required this.wkhi,
    required this.wklo,
    required this.wkhicmAdj,
    required this.wklocmAdj,
    required this.xDt,
    required this.cAct,
    required this.previousClose,
    required this.dayEndClose,
    required this.iislPtsChange,
    required this.iislPercChange,
    required this.yPC,
    required this.mPC,
  });
  late final String symbol;
  late final String open;
  late final String high;
  late final String low;
  late final String ltP;
  late final String ptsC;
  late final String per;
  late final String trdVol;
  late final String trdVolM;
  late final String ntP;
  late final String mVal;
  late final String wkhi;
  late final String wklo;
  late final String wkhicmAdj;
  late final String wklocmAdj;
  late final String xDt;
  late final String cAct;
  late final String previousClose;
  late final String dayEndClose;
  late final String iislPtsChange;
  late final String iislPercChange;
  late final String yPC;
  late final String mPC;
  
  Data.fromJson(Map<String, dynamic> json){
    symbol = json['symbol'];
    open = json['open'];
    high = json['high'];
    low = json['low'];
    ltP = json['ltP'];
    ptsC = json['ptsC'];
    per = json['per'];
    trdVol = json['trdVol'];
    trdVolM = json['trdVolM'];
    ntP = json['ntP'];
    mVal = json['mVal'];
    wkhi = json['wkhi'];
    wklo = json['wklo'];
    wkhicmAdj = json['wkhicm_adj'];
    wklocmAdj = json['wklocm_adj'];
    xDt = json['xDt'];
    cAct = json['cAct'];
    previousClose = json['previousClose'];
    dayEndClose = json['dayEndClose'];
    iislPtsChange = json['iislPtsChange'];
    iislPercChange = json['iislPercChange'];
    yPC = json['yPC'];
    mPC = json['mPC'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['symbol'] = symbol;
    _data['open'] = open;
    _data['high'] = high;
    _data['low'] = low;
    _data['ltP'] = ltP;
    _data['ptsC'] = ptsC;
    _data['per'] = per;
    _data['trdVol'] = trdVol;
    _data['trdVolM'] = trdVolM;
    _data['ntP'] = ntP;
    _data['mVal'] = mVal;
    _data['wkhi'] = wkhi;
    _data['wklo'] = wklo;
    _data['wkhicm_adj'] = wkhicmAdj;
    _data['wklocm_adj'] = wklocmAdj;
    _data['xDt'] = xDt;
    _data['cAct'] = cAct;
    _data['previousClose'] = previousClose;
    _data['dayEndClose'] = dayEndClose;
    _data['iislPtsChange'] = iislPtsChange;
    _data['iislPercChange'] = iislPercChange;
    _data['yPC'] = yPC;
    _data['mPC'] = mPC;
    return _data;
  }
}

class LatestData {
  LatestData({
    required this.indexName,
    required this.open,
    required this.high,
    required this.low,
    required this.ltp,
    required this.ch,
    required this.per,
    required this.yCls,
    required this.mCls,
    required this.yHigh,
    required this.yLow,
  });
  late final String indexName;
  late final String open;
  late final String high;
  late final String low;
  late final String ltp;
  late final String ch;
  late final String per;
  late final String yCls;
  late final String mCls;
  late final String yHigh;
  late final String yLow;
  
  LatestData.fromJson(Map<String, dynamic> json){
    indexName = json['indexName'];
    open = json['open'];
    high = json['high'];
    low = json['low'];
    ltp = json['ltp'];
    ch = json['ch'];
    per = json['per'];
    yCls = json['yCls'];
    mCls = json['mCls'];
    yHigh = json['yHigh'];
    yLow = json['yLow'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['indexName'] = indexName;
    _data['open'] = open;
    _data['high'] = high;
    _data['low'] = low;
    _data['ltp'] = ltp;
    _data['ch'] = ch;
    _data['per'] = per;
    _data['yCls'] = yCls;
    _data['mCls'] = mCls;
    _data['yHigh'] = yHigh;
    _data['yLow'] = yLow;
    return _data;
  }
}