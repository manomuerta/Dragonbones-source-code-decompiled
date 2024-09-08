package _639
{
   import _97._100;
   
   public class _642 extends _640
   {
      private static var instance:_642;
      
      private static var propertyList:Array = [["deleteConfirm",true],["imageSmooth",true],["autoBindSlot",true],["backgroundColor",_100.backgroundColor],["backgroundSize",25],["boneColor",_100._2266],["boneSize",8],["language",null],["loginTip",true],["_useruler",true],["_assistLine",true],["_assistLineenable",true],["_assistLineColor",_100.assistLine]];
      
      private var _5644:Boolean = true;
      
      private var _5646:Boolean = true;
      
      private var _5645:Boolean = true;
      
      private var _backgroundColor:uint;
      
      private var _5643:int = 25;
      
      private var _5647:uint;
      
      private var _5648:int = 8;
      
      private var _language:String = null;
      
      private var _12970:Boolean = true;
      
      private var _useruler:Boolean = true;
      
      private var _assistLine:Boolean = true;
      
      private var _assistLineenable:Boolean = true;
      
      private var _assistLineColor:uint;
      
      public function _642()
      {
         super();
         _5633 = "preference.amf";
         _5627 = "preferenceDebug.amf";
      }
      
      public static function getInstance() : _642
      {
         if(instance == null)
         {
            instance = new _642();
         }
         return instance;
      }
      
      public function get useruler() : Boolean
      {
         return this._useruler;
      }
      
      public function set useruler(param1:Boolean) : void
      {
         this._useruler = param1;
         _5621("useruler",this["useruler"]);
      }
      
      public function get assistLine() : Boolean
      {
         return this._assistLine;
      }
      
      public function set assistLine(param1:Boolean) : void
      {
         this._assistLine = param1;
         _5621("assistLine",this["assistLine"]);
      }
      
      public function get assistLineenable() : Boolean
      {
         return this._assistLineenable;
      }
      
      public function set assistLineenable(param1:Boolean) : void
      {
         this._assistLineenable = param1;
         _5621("assistLineenable",this["assistLineenable"]);
      }
      
      public function get assistLineColor() : int
      {
         return this._assistLineColor;
      }
      
      public function set assistLineColor(param1:int) : void
      {
         this._assistLineColor = param1;
         _5621("assistLineColor",this["assistLineColor"]);
      }
      
      public function get boneSize() : int
      {
         return this._5648;
      }
      
      public function set boneSize(param1:int) : void
      {
         this._5648 = param1;
         _5621("boneSize",this["boneSize"]);
      }
      
      public function get boneColor() : uint
      {
         return this._5647;
      }
      
      public function set boneColor(param1:uint) : void
      {
         this._5647 = param1;
         _5621("boneColor",this["boneColor"]);
      }
      
      public function get backgroundSize() : int
      {
         return this._5643;
      }
      
      public function set backgroundSize(param1:int) : void
      {
         this._5643 = param1;
         _5621("backgroundSize",this["backgroundSize"]);
      }
      
      public function get backgroundColor() : uint
      {
         return this._backgroundColor;
      }
      
      public function set backgroundColor(param1:uint) : void
      {
         this._backgroundColor = param1;
         _5621("backgroundColor",this["backgroundColor"]);
      }
      
      public function get autoBindSlot() : Boolean
      {
         return this._5645;
      }
      
      public function set autoBindSlot(param1:Boolean) : void
      {
         this._5645 = param1;
         _5621("autoBindSlot",this["autoBindSlot"]);
      }
      
      public function get imageSmooth() : Boolean
      {
         return this._5646;
      }
      
      public function set imageSmooth(param1:Boolean) : void
      {
         this._5646 = param1;
         _5621("imageSmooth",this["imageSmooth"]);
      }
      
      public function get deleteConfirm() : Boolean
      {
         return this._5644;
      }
      
      public function set deleteConfirm(param1:Boolean) : void
      {
         this._5644 = param1;
         _5621("deleteConfirm",this["deleteConfirm"]);
      }
      
      public function get language() : String
      {
         return this._language;
      }
      
      public function set language(param1:String) : void
      {
         this._language = param1;
         _5621("language",this._language);
      }
      
      public function get loginTip() : Boolean
      {
         return this._12970;
      }
      
      public function set loginTip(param1:Boolean) : void
      {
         this._12970 = param1;
         _5621("loginTip",this._12970);
      }
      
      public function _1664() : void
      {
         var _loc1_:Object = null;
         var _loc2_:Array = null;
         for each(_loc2_ in propertyList)
         {
            _loc1_ = _5629(_loc2_[0]);
            this[_loc2_[0]] = _loc1_ != null ? _loc1_ : _loc2_[1];
         }
      }
      
      public function _3525() : void
      {
         var _loc1_:Array = null;
         for each(_loc1_ in propertyList)
         {
            _5628(_loc1_[0],this[_loc1_[0]]);
         }
         save(true);
      }
   }
}

