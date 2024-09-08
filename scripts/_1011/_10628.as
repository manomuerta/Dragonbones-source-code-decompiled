package _1011
{
   import _1045.Button;
   import _1045.Group;
   import _1045.RadioButton;
   import _1045._1081;
   import _127._128;
   import _127._171;
   import _51._50;
   import _51._71;
   import _721._720;
   import _97._125;
   import _997._996;
   import egret.utils.tr;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class _10628 extends _171
   {
      private var _7061:_720;
      
      private var _callback:Function;
      
      private var _10892:Vector.<_128>;
      
      private var _10897:RadioButton;
      
      private var _10817:RadioButton;
      
      private var _10895:RadioButton;
      
      private var _10894:RadioButton;
      
      private var _10891:_128;
      
      private var radioGroup:_1081;
      
      public var _5554:Button;
      
      private var _10667:Object;
      
      public function _10628(param1:_720, param2:Function)
      {
         this._10892 = new Vector.<_128>();
         super();
         this.minWidth = 320;
         this.title = tr("Export.target.title");
         this.width = NaN;
         this._7061 = param1;
         this._callback = param2;
      }
      
      override protected function _2438() : void
      {
         var _loc2_:Group = null;
         var _loc4_:Group = null;
         super._2438();
         var _loc1_:Group = _125._2403();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc2_ = _125._2413();
         var _loc3_:_996 = new _996();
         _loc3_.percentHeight = 100;
         _loc4_ = _125._2413();
         _loc2_.percentWidth = 100;
         _loc4_.percentWidth = 100;
         _2512.addElement(_loc1_);
         _loc1_.addElement(_loc2_);
         _loc1_.addElement(_loc3_);
         _loc1_.addElement(_loc4_);
         this.radioGroup = new _1081();
         this._10897 = new RadioButton();
         this._10817 = new RadioButton();
         this._10895 = new RadioButton();
         this._10894 = new RadioButton();
         this._10897.group = this.radioGroup;
         this._10817.group = this.radioGroup;
         this._10895.group = this.radioGroup;
         this._10894.group = this.radioGroup;
         this._10891 = new _128();
         _loc2_.addElement(this._10897);
         _loc2_.addElement(this._10817);
         _loc2_.addElement(this._10895);
         _loc2_.addElement(this._10894);
         _loc2_.addElement(this._10891);
         this._10891.label = tr("Export.target.include");
         this._10897.label = tr("Export.target.all");
         this._10817.label = tr("Export.target.selected");
         this._10895.label = tr("Export.target.opened");
         this._10894.label = tr("Export.target.custom");
         this._10896(_loc4_);
         this._5554 = _125._2399();
         _2632.addElement(this._5554);
         _2512.addElement(_2632);
         _2632.bottom = 20;
         _2632.right = 20;
         this._5554.addEventListener(MouseEvent.CLICK,this._7060);
         this._10891.addEventListener(Event.CHANGE,this._10890);
         this.radioGroup.addEventListener(Event.CHANGE,this._10893);
         this.refresh();
      }
      
      private function _10890(param1:Event) : void
      {
         this._7061.includeChild = this._10891.selected;
         this._7061._10713();
         this.refresh();
      }
      
      private function _7060(param1:MouseEvent) : void
      {
         if(this._callback != null)
         {
            this._callback();
         }
         close();
      }
      
      private function _10893(param1:Event) : void
      {
         if(this._10897.selected)
         {
            this._7061.targetType = _720.TARGET_ALL;
         }
         else if(this._10817.selected)
         {
            this._7061.targetType = _720.TARGET_SELECTED;
         }
         else if(this._10895.selected)
         {
            this._7061.targetType = _720.TARGET_OPENED;
         }
         else if(this._10894.selected)
         {
            this._7061.targetType = _720.TARGET_CUSTOM;
         }
         this._7061._10713();
         this.refresh();
      }
      
      private function _10896(param1:Group) : void
      {
         var _loc6_:_50 = null;
         var _loc7_:_128 = null;
         var _loc2_:_71 = this._7061.dragonBonesVO;
         var _loc3_:Array = [];
         this._10667 = {};
         var _loc4_:int = 0;
         var _loc5_:int = int(_loc2_._2126.length);
         while(_loc4_ < _loc5_)
         {
            _loc6_ = _loc2_._2126[_loc4_];
            _loc3_.push(_loc6_.name);
            this._10667[_loc6_.name] = _loc6_._10664();
            _loc4_++;
         }
         _loc4_ = 0;
         _loc5_ = int(_loc3_.length);
         while(_loc4_ < _loc5_)
         {
            (_loc7_ = new _128()).label = _loc3_[_loc4_];
            _loc7_.addEventListener(Event.CHANGE,this._10889);
            this._10892.push(_loc7_);
            param1.addElement(_loc7_);
            _loc4_++;
         }
      }
      
      private function _10889(param1:Event) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc2_:_128 = param1.target as _128;
         var _loc3_:String = _loc2_.label;
         this._7061.targetType = _720.TARGET_CUSTOM;
         this._7061._10711.length = 0;
         _loc4_ = 0;
         _loc5_ = int(this._10892.length);
         while(_loc4_ < _loc5_)
         {
            if(this._10892[_loc4_].selected)
            {
               this._7061._10711.push(this._10892[_loc4_].label);
            }
            _loc4_++;
         }
         this.refresh();
      }
      
      private function refresh() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         this._10897.selected = false;
         this._10817.selected = false;
         this._10895.selected = false;
         this._10894.selected = false;
         switch(this._7061.targetType)
         {
            case _720.TARGET_ALL:
               this._10897.selected = true;
               break;
            case _720.TARGET_SELECTED:
               this._10817.selected = true;
               break;
            case _720.TARGET_OPENED:
               this._10895.selected = true;
               break;
            case _720.TARGET_CUSTOM:
               this._10894.selected = true;
         }
         this._10891.selected = this._7061.includeChild;
         if(this._7061.targetType == _720.TARGET_ALL)
         {
            _loc1_ = 0;
            _loc2_ = int(this._10892.length);
            while(_loc1_ < _loc2_)
            {
               this._10892[_loc1_].selected = true;
               _loc1_++;
            }
         }
         else
         {
            _loc1_ = 0;
            _loc2_ = int(this._10892.length);
            while(_loc1_ < _loc2_)
            {
               this._10892[_loc1_].selected = this._7061._10711.indexOf(this._10892[_loc1_].label) != -1;
               _loc1_++;
            }
         }
         this._5554.enabled = this._7061._10711.length > 0;
      }
   }
}

