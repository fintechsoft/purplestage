import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:purplestage/utils/core_export.dart';


class EventController extends GetxController with GetSingleTickerProviderStateMixin implements GetxService {

  final EventRepo eventRepo;
  EventController({required this.eventRepo});

  int _apiHitCount = 0;

  int? _pageSize;
  int _offset = 1;

  int get offset => _offset;
  int? get pageSize => _pageSize;

  List <EventData>? _eventDataList;
  List <EventData>? get eventDataList => _eventDataList;

  EventData? _eventData;
  EventData? get eventData => _eventData;

  final List<String> _eventType = ['cultural', "Fest","Academics","Placement drive","Welfare","Get together","Summit","Forum","Mela","Star Night","DJ night","Unofficial party","Other"];
  List<String> get eventType => _eventType;

  String _selectedEventType = "cultural";
  String get selectedEventType => _selectedEventType;

  AutoScrollController? menuScrollController;

  final GlobalKey<FormState> noteFormKey = GlobalKey<FormState>();

  bool isDateRangeValid = true;

  bool _isPosterImageValid = true;
  bool get isPosterImageValid => _isPosterImageValid;

  XFile? _pickedPosterImage;
  XFile? get pickedPosterImage => _pickedPosterImage;

  String? _networkPosterImage;
  String? get networkPosterImage => _networkPosterImage;

  bool _isLoading = false;
  bool get isLoading => _isLoading;


  DateTime? eventdateTime;

  TextEditingController? validationController;
  TextEditingController? eventNameController;
  TextEditingController? institutionNameController;
  TextEditingController? contactNoController;
  TextEditingController? typeOfEventController;
  TextEditingController? eventTimeController;
  TextEditingController? venueController;
  TextEditingController? eventDescriptionController;
  TextEditingController? eventPosterController;
  TextEditingController? posterDescriptionController;
  String typeOfEvent = '';

  setEventType({required String type, bool shouldUpdate = true}){
    _selectedEventType = type;
    if(shouldUpdate){
      update();
    }
  }

  bool _isPaid = false;
  bool get isPaid => _isPaid;


  bool _isChecked = false;
  bool get isChecked => _isChecked;

  TabController? listTabController;

  bool _isVerified = false;
  bool get isVerified => _isVerified;

  final ScrollController scrollController = ScrollController();

  @override
  void onInit(){
    super.onInit();
    scrollController.addListener(() {
      if(scrollController.position.maxScrollExtent == scrollController.position.pixels) {
        if(_offset < _pageSize! ) {
          getEventList(offset+1, paginationLoading: true);
        }
      }
    });
  }

  @override
  void dispose(){
    super.dispose();
  }

  void initializeEventValues (EventData eventData){
    _networkPosterImage = eventData.eventPosterFullPath;
  }

  Future<void> setEventData(EventData eventdata)
  async {
    _eventData=eventdata;
  }

  void debugLongPrint(String text) {
    final pattern = RegExp('.{1,800}'); // Split the text every 800 characters
    pattern.allMatches(text).forEach((match) => debugPrint(match.group(0)));
  }

  Future<void> getEventList(int offset, {bool reload = false, int index = 0, bool isFirst = false, bool paginationLoading = false}) async {
    _offset = offset;
    _apiHitCount ++;

    if(reload){
      _eventDataList = null;
    }
    if(paginationLoading){
      _isLoading = true;
    }
    if(!isFirst){
      update();
    }

    Response response = await eventRepo.getEventList(offset: offset);
    String ss= response.body['response_code'].toString();

    if(response.statusCode == 200 && response.body['response_code'] == 'default_200'){
      List<dynamic> eventList = response.body['content']['data'];
      String listcount = eventList.length.toString();
      print("List -- $listcount");
      if(_offset == 1){
        _eventDataList = [];
        for(var item in eventList){
          _eventDataList?.add (EventData.fromJson(item));
        }
      }else{
        for(var item in eventList){
          _eventDataList?.add (EventData.fromJson(item));
        }
      }
      _pageSize = response.body['content']['last_page'];
    }
    else{
     ApiChecker.checkApi(response);
    }
    _apiHitCount--;

    _isLoading = false;
    if(_apiHitCount==0){
      update();
    }
  }

}