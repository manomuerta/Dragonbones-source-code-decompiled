package _1011
{
   import _1033._12500;
   import _1045.Button;
   import _1045.Group;
   import _1045.Scroller;
   import _1045._1082;
   import _1177.UIEvent;
   import _1185._1189;
   import _1185._1197;
   import _127._128;
   import _127._171;
   import _721._720;
   import _97._125;
   import egret.core._1139;
   import egret.utils.tr;
   import flash.events.MouseEvent;
   
   public class _12485 extends _171
   {
      private var _7061:_720;
      
      private var _callback:Function;
      
      private var _12767:Vector.<_128>;
      
      public var _5554:Button;
      
      private var _10667:Object;
      
      public var _2491:Scroller;
      
      public function _12485(param1:_720, param2:Function)
      {
         this._2491 = new Scroller();
         super();
         this.maxWidth = 800;
         this.maxHeight = 750;
         this.minWidth = 250;
         this.minHeight = 325;
         this.title = tr("Export.animation.select");
         this._7061 = param1;
         this._callback = param2;
         this._12767 = new Vector.<_128>();
      }
      
      override protected function _2438() : void
      {
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:_128 = null;
         super._2438();
         var _loc1_:_1082 = new _1082();
         _loc1_.fillColor = 2041905;
         _loc1_._2564 = 1;
         _loc1_._2562 = 1;
         _loc1_._2563 = 1777701;
         _loc1_.top = 16;
         _loc1_.left = 7;
         _loc1_.right = 7;
         _loc1_.bottom = 64;
         this.addElementAt(_loc1_,0);
         var _loc2_:_1197 = _2512.layout as _1197;
         if(_loc2_)
         {
            _loc2_._2420 = 18;
            _loc2_._2419 = 10;
            _loc2_._2416 = 8;
         }
         _2512.percentWidth = 100;
         var _loc3_:Group = _125._2413();
         var _loc4_:_1197;
         (_loc4_ = _loc3_.layout as _1197)._2420 = 5;
         _loc3_.percentHeight = 100;
         _loc3_.percentWidth = 100;
         if(this._7061)
         {
            if(this._7061.allAnimations)
            {
               _loc10_ = 0;
               _loc11_ = int(this._7061.allAnimations.length);
               while(_loc10_ < _loc11_)
               {
                  (_loc12_ = new _128()).label = this._7061.allAnimations[_loc10_];
                  _loc12_.selected = this._7061.exportAnimations.indexOf(this._7061.allAnimations[_loc10_]) != -1;
                  _loc3_.addElement(_loc12_);
                  this._12767.push(_loc12_);
                  _loc10_++;
               }
            }
         }
         var _loc5_:Group;
         (_loc5_ = new Group()).percentWidth = 100;
         _loc5_.percentHeight = 100;
         _loc5_.addElement(_loc3_);
         _loc5_.addElement(this._2491);
         var _loc6_:Group;
         (_loc6_ = new Group()).height = 40;
         _2512.addElement(_loc5_);
         _2512.addElement(_loc6_);
         this._2491.right = 0;
         this._2491.left = 10;
         this._2491.top = 0;
         this._2491.bottom = 0;
         this._2491._6182 = _1139.AUTO;
         this._2491.viewport = _loc3_;
         var _loc7_:Group;
         (_loc7_ = _125._11551()).percentWidth = 100;
         _loc7_.percentHeight = 100;
         var _loc8_:_1189;
         (_loc8_ = _loc7_.layout as _1189).padding = 20;
         _loc8_._2410 = 15;
         this._5554 = _125._2399();
         _loc7_.addElement(this._5554);
         var _loc9_:_12500;
         (_loc9_ = new _12500()).bottom = 48;
         addElement(_loc9_);
         addElement(_loc7_);
         this._5554.addEventListener(MouseEvent.CLICK,this._7060);
         addEventListener(UIEvent.CREATION_COMPLETE,this.onComplete);
      }
      
      private function onComplete(param1:UIEvent) : void
      {
         removeEventListener(UIEvent.CREATION_COMPLETE,this.onComplete);
         this.width = this.minWidth;
         this.height = this.minHeight;
      }
      
      private function _7060(param1:MouseEvent) : void
      {
         if(this._callback != null)
         {
            this._callback();
         }
         close();
      }
      
      public function get _12766() : Array
      {
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         var _loc3_:int = int(this._12767.length);
         while(_loc2_ < _loc3_)
         {
            if(this._12767[_loc2_].selected)
            {
               _loc1_.push(this._12767[_loc2_].label);
            }
            _loc2_++;
         }
         return _loc1_;
      }
   }
}

