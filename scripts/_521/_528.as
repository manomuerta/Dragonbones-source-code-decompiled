package _521
{
   import _1315._1318;
   import _1404._1407;
   import _1529._1530;
   import _51._50;
   import _51._70;
   import _51._79;
   import _555.LibraryPanelController;
   import _6.Context;
   import _6._7;
   import _639._638;
   import _639._642;
   import _724._11251;
   import _724._725;
   import _724._733;
   import _724._735;
   import _73._74;
   import flash.display.BitmapData;
   
   public class _528 extends _7
   {
      public static var _14511:BitmapData;
      
      public static var _14513:BitmapData;
      
      public static var _14512:BitmapData;
      
      public static var _14510:BitmapData;
      
      private static var _3819:Class = _528__3819;
      
      private static var _3816:Class = _528__3816;
      
      private static var _3821:Class = _528__3821;
      
      private static var _14516:Class = _528__14516;
      
      private static var _14518:Class = _528__14518;
      
      private static var _14517:Class = _528__14517;
      
      private static var _14519:Class = _528__14519;
      
      private static var _14514:Class = _528__14514;
      
      public static const TYPE_IMAGE:int = 0;
      
      public static const TYPE_TEXTURE:int = 1;
      
      public static const TYPE_SUB_TEXTURE:int = 2;
      
      public static const TYPE_MOVIECLIP:int = 3;
      
      public static const EMPTY_PLACEHOLDER:BitmapData = new BitmapData(1,1,true,0);
      
      public static const SUPPORT_FILES:Array = ["json","xml","amf3","png","dbswf","jpg","jpeg","svg","swf"];
      
      public static var _3818:_1318 = new _1318();
      
      private var _3812:Vector.<_70>;
      
      public function _528()
      {
         this._3812 = new Vector.<_70>();
         super();
      }
      
      public static function _14515() : void
      {
         var _loc1_:String = _642.getInstance().language;
         if(Boolean(_loc1_) && _loc1_ == _1530.zh_CN)
         {
            _14511 = new _3816().bitmapData;
            _14513 = new _3819().bitmapData;
            _14512 = new _3821().bitmapData;
            _14510 = new _14516().bitmapData;
         }
         else
         {
            _14511 = new _14517().bitmapData;
            _14513 = new _14518().bitmapData;
            _14512 = new _14519().bitmapData;
            _14510 = new _14514().bitmapData;
         }
      }
      
      public static function _3820(param1:String) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var _loc2_:String = param1.toLowerCase();
         return SUPPORT_FILES.indexOf(_loc2_) != -1;
      }
      
      public function _3278(param1:_50) : void
      {
         var _loc2_:_79 = null;
         var _loc5_:_70 = null;
         var _loc3_:int = 0;
         var _loc4_:int = int(param1._1780.length);
         while(_loc3_ < _loc4_)
         {
            _loc2_ = param1._1780[_loc3_];
            for each(_loc5_ in _loc2_._1765)
            {
               this._3808(param1.name,_loc5_);
            }
            _loc3_++;
         }
      }
      
      public function _3813(param1:_70) : void
      {
         if(this._3814)
         {
            param1._2104 = this._3810(param1);
            if(param1._2104 == null)
            {
               param1._2104 = new _735(param1.path,param1._1813,param1._1806);
               this._3812.push(param1);
            }
            else
            {
               param1._1806 = param1.height;
               param1._1813 = param1.width;
            }
         }
      }
      
      public function _3808(param1:String, param2:_70) : void
      {
         var _loc3_:_733 = null;
         if(param2.type == _74.ARMATURE)
         {
            param2._2104 = this._2861._3678._3809(param2.path);
         }
         else
         {
            _loc3_ = this._2861._3678._3805(param1);
            if(_loc3_)
            {
               param2._2104 = _loc3_._3807(param2.path);
            }
         }
         if(param2._2104 == null)
         {
            if(param2.type == _74.BOUNDINGBOX)
            {
               param2._2104 = this._3810(param2);
            }
            else
            {
               param2._2104 = new _735(param2.path,param2._1813,param2._1806);
               this._3812.push(param2);
            }
         }
         else
         {
            param2._1806 = param2.height;
            param2._1813 = param2.width;
         }
      }
      
      public function _3817(param1:_70) : void
      {
         var _loc2_:int = int(this._3812.indexOf(param1));
         if(_loc2_ < 0)
         {
            this._3812.push(param1);
         }
      }
      
      public function _3815() : Array
      {
         var _loc2_:_725 = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc1_:Array = [];
         if(this._3814)
         {
            _loc3_ = 0;
            _loc4_ = int(this._3812.length);
            while(_loc3_ < _loc4_)
            {
               _loc2_ = this._3810(this._3812[_loc3_]);
               if(_loc2_)
               {
                  this._3812[_loc3_]._2104 = _loc2_;
                  _loc1_.push(this._3812[_loc3_]);
               }
               _loc3_++;
            }
            _loc3_ = 0;
            _loc4_ = int(_loc1_.length);
            while(_loc3_ < _loc4_)
            {
               this._3812.splice(this._3812.indexOf(_loc1_[_loc3_]),1);
               _loc3_++;
            }
         }
         return _loc1_;
      }
      
      public function get _3814() : _733
      {
         if(this._2861._3678)
         {
            return this._2861._3678._3811;
         }
         return null;
      }
      
      public function _3806(param1:String) : _725
      {
         return this._3814._3807(param1);
      }
      
      public function _3810(param1:_70) : _725
      {
         if(param1.type == _74.ARMATURE)
         {
            return this._2861._3678._3809(param1.path);
         }
         if(param1.type == _74.BOUNDINGBOX)
         {
            return new _11251(param1._11278);
         }
         return this._3814._3807(param1.path);
      }
      
      public function get _2861() : LibraryPanelController
      {
         return _1407.getInstance(LibraryPanelController) as LibraryPanelController;
      }
      
      public function get _2214() : _638
      {
         return Context.getInstance()._1568.appModel as _638;
      }
   }
}

