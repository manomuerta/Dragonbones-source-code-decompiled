package _97
{
   import _1033._12500;
   import _1045.Button;
   import _1045.Group;
   import _1045.Label;
   import _1185._1186;
   import _1185._1188;
   import _1185._1189;
   import _1185._1196;
   import _1185._1197;
   import _1193._1192;
   import _127._142;
   import _1374.IconButton;
   import _822._828;
   import _822._854;
   import _834._835;
   import egret.utils.tr;
   
   public class _125
   {
      public static var _2418:int = 16;
      
      public static var _2415:int = 16;
      
      public static var _2421:int = 16;
      
      public static var _2412:int = 16;
      
      public static var _2422:int = 10;
      
      public static var _2411:int = 26;
      
      public function _125()
      {
         super();
      }
      
      public static function _2402(param1:_1192) : Group
      {
         var _loc2_:Group = new Group();
         _loc2_.layout = param1;
         if(param1 is _1189)
         {
            _loc2_.left = 0;
            _loc2_.right = 0;
            _loc2_.top = 0;
            _loc2_.bottom = 0;
            (param1 as _1189).gap = _2422;
            (param1 as _1189)._2419 = _2418;
            (param1 as _1189)._2416 = _2415;
            (param1 as _1189)._2420 = _2421;
            (param1 as _1189)._2410 = _2412;
         }
         else if(param1 is _1197)
         {
            _loc2_.left = 0;
            _loc2_.right = 0;
            _loc2_.top = 0;
            _loc2_.bottom = 0;
            (param1 as _1197).gap = _2422;
            (param1 as _1197)._2419 = _2418;
            (param1 as _1197)._2416 = _2415;
            (param1 as _1197)._2420 = _2421;
            (param1 as _1197)._2410 = _2412;
         }
         else if(param1 is _1186)
         {
            _loc2_.left = _2418;
            _loc2_.right = _2415;
            _loc2_.top = _2421;
            _loc2_.bottom = _2412;
         }
         return _loc2_;
      }
      
      public static function _2414(param1:int = 6) : Group
      {
         var _loc2_:Group = new Group();
         var _loc3_:_1189 = new _1189();
         _loc3_.verticalAlign = "middle";
         _loc3_.gap = param1;
         _loc2_.layout = _loc3_;
         return _loc2_;
      }
      
      public static function _2397(param1:int = 6) : Group
      {
         var _loc2_:Group = new Group();
         var _loc3_:_1189 = new _1189();
         _loc3_._2401 = _1188.CENTER;
         _loc3_.verticalAlign = "middle";
         _loc3_.gap = param1;
         _loc2_.layout = _loc3_;
         return _loc2_;
      }
      
      public static function _13692(param1:int = 6) : Group
      {
         var _loc2_:Group = new Group();
         var _loc3_:_1189 = new _1189();
         _loc3_._2401 = _1188.LEFT;
         _loc3_.verticalAlign = "middle";
         _loc3_.gap = param1;
         _loc2_.layout = _loc3_;
         return _loc2_;
      }
      
      public static function _13691(param1:int = 6) : Group
      {
         var _loc2_:Group = new Group();
         var _loc3_:_1189 = new _1189();
         _loc3_._2401 = _1188.LEFT;
         _loc3_.verticalAlign = _1196.TOP;
         _loc3_.gap = param1;
         _loc2_.layout = _loc3_;
         return _loc2_;
      }
      
      public static function _2398(param1:int = 6) : Group
      {
         var _loc2_:Group = new Group();
         var _loc3_:_1189 = new _1189();
         _loc3_._2401 = _1188.RIGHT;
         _loc3_.verticalAlign = "middle";
         _loc3_.gap = param1;
         _loc2_.layout = _loc3_;
         return _loc2_;
      }
      
      public static function _2403(param1:int = 6) : Group
      {
         var _loc2_:Group = new Group();
         var _loc3_:_1189 = new _1189();
         _loc3_.verticalAlign = "top";
         _loc3_.gap = param1;
         _loc2_.layout = _loc3_;
         return _loc2_;
      }
      
      public static function _13690(param1:int = 6) : Group
      {
         var _loc2_:Group = new Group();
         var _loc3_:_1189 = new _1189();
         _loc3_._2401 = _1188.CENTER;
         _loc3_.verticalAlign = "top";
         _loc3_.gap = param1;
         _loc2_.layout = _loc3_;
         return _loc2_;
      }
      
      public static function _2396() : Group
      {
         var _loc1_:Group = new Group();
         var _loc2_:_1189 = new _1189();
         _loc2_.verticalAlign = "bottom";
         _loc1_.layout = _loc2_;
         return _loc1_;
      }
      
      public static function _11551() : Group
      {
         var _loc1_:Group = new Group();
         var _loc2_:_1189 = new _1189();
         _loc2_._2401 = _1188.CENTER;
         _loc2_.verticalAlign = "bottom";
         _loc1_.layout = _loc2_;
         return _loc1_;
      }
      
      public static function _2413(param1:int = 6) : Group
      {
         var _loc2_:Group = new Group();
         var _loc3_:_1197 = new _1197();
         _loc3_.gap = param1;
         _loc2_.layout = _loc3_;
         return _loc2_;
      }
      
      public static function _2395(param1:int = 6) : Group
      {
         var _loc2_:Group = new Group();
         var _loc3_:_1197 = new _1197();
         _loc3_._2401 = _1188.CENTER;
         _loc3_.gap = param1;
         _loc2_.layout = _loc3_;
         return _loc2_;
      }
      
      public static function _2404() : Group
      {
         var _loc1_:Group = new Group();
         var _loc2_:_1197 = new _1197();
         _loc2_.verticalAlign = _1196.TOP;
         _loc1_.layout = _loc2_;
         return _loc1_;
      }
      
      public static function _2409(param1:uint = 16711680) : Label
      {
         var _loc2_:Label = new Label();
         _loc2_.percentWidth = 100;
         _loc2_.textColor = param1;
         return _loc2_;
      }
      
      public static function _12512() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         var _loc2_:_1189 = new _1189();
         _loc2_.gap = 10;
         _loc2_._2420 = 20;
         _loc2_._2401 = "right";
         _loc1_.layout = _loc2_;
         return _loc1_;
      }
      
      public static function _12511() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         var _loc2_:_1189 = new _1189();
         _loc2_.gap = 10;
         _loc2_._2420 = 20;
         _loc2_._2401 = "center";
         _loc1_.layout = _loc2_;
         return _loc1_;
      }
      
      public static function _2405() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.label = tr("BrowseButton");
         return _loc1_;
      }
      
      public static function _12513(param1:String = "") : Button
      {
         var _loc2_:Button = new Button();
         _loc2_.width = 92;
         _loc2_.height = _2411;
         _loc2_.label = param1;
         return _loc2_;
      }
      
      public static function _2399() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.width = 92;
         _loc1_.height = _2411;
         _loc1_.label = tr("Alert.Complete");
         return _loc1_;
      }
      
      public static function _2406() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.width = 92;
         _loc1_.height = _2411;
         _loc1_.label = tr("Alert.Cancel");
         return _loc1_;
      }
      
      public static function _2417() : _828
      {
         var _loc1_:_828 = new _828();
         _loc1_.color = _100._2252;
         _loc1_.height = 1;
         _loc1_.percentWidth = 100;
         return _loc1_;
      }
      
      public static function _14328() : _12500
      {
         var _loc1_:_12500 = new _12500();
         _loc1_.percentWidth = 100;
         return _loc1_;
      }
      
      public static function _10680() : _854
      {
         var _loc1_:_854 = new _854();
         _loc1_.color = _100._2252;
         _loc1_.width = 1;
         _loc1_.percentHeight = 100;
         return _loc1_;
      }
      
      public static function _2400(param1:String = "") : Label
      {
         var _loc2_:Label = new Label();
         _loc2_.text = param1;
         _loc2_.alpha = 0.9;
         _loc2_.size = 17;
         return _loc2_;
      }
      
      public static function _2407() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.alpha = 0.7;
         _loc1_.size = 13;
         return _loc1_;
      }
      
      public static function _2408(param1:String) : Button
      {
         var _loc2_:Button = new Button();
         _loc2_.height = 40;
         _loc2_.setStyle("size",18);
         _loc2_.label = param1;
         return _loc2_;
      }
      
      public static function _2394(param1:String, param2:Object = null, param3:* = null) : IconButton
      {
         var _loc4_:_142;
         (_loc4_ = new _142()).skinName = _835;
         _loc4_.label = param1;
         _loc4_.userData = param3;
         _loc4_.buttonMode = true;
         if(param2)
         {
            (_loc4_ as IconButton).icon = param2;
         }
         return _loc4_;
      }
      
      public static function _12836(param1:String) : Label
      {
         var _loc2_:Label = new Label();
         _loc2_.text = param1;
         return _loc2_;
      }
      
      public static function _12946(param1:String) : Label
      {
         var _loc2_:Label = new Label();
         _loc2_.percentWidth = 100;
         _loc2_.text = param1;
         return _loc2_;
      }
      
      public static function _14329() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.width = 92;
         _loc1_.height = _2411;
         _loc1_.label = tr("MenuItem-paste");
         return _loc1_;
      }
   }
}

