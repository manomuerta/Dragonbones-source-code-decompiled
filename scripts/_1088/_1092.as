package _1088
{
   import _1038._1039;
   import _1045.List;
   import _1177.CollectionEvent;
   import _1177.UIEvent;
   import egret.core.ns_egret;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   use namespace ns_egret;
   
   public class _1092 extends List
   {
      ns_egret static var _8419:int = 5;
      
      public var _8412:DisplayObject;
      
      public var _8410:_1087;
      
      private var _7623:Boolean = false;
      
      private var _8417:_1091;
      
      private var _8416:Number = -1;
      
      public function _1092()
      {
         super();
         ns_egret::_8100 = false;
         this._8418 = new _1091();
      }
      
      override public function set dataProvider(param1:_1039) : void
      {
         if(dataProvider === param1)
         {
            return;
         }
         super.dataProvider = param1;
         this._7623 = true;
         _2466();
      }
      
      override public function set _5987(param1:String) : void
      {
         if(_5987 == param1)
         {
            return;
         }
         super._5987 = param1;
         this._7623 = true;
         _2466();
      }
      
      override public function set _6146(param1:Function) : void
      {
         if(_6146 == param1)
         {
            return;
         }
         super._6146 = param1;
         this._7623 = true;
         _2466();
      }
      
      protected function get _8418() : _1091
      {
         return this._8417;
      }
      
      protected function set _8418(param1:_1091) : void
      {
         if(this._8417 == param1)
         {
            return;
         }
         this._8417 = param1;
         this._8417.addEventListener(UIEvent.OPEN,this.ns_egret::_7417);
         this._8417.addEventListener(UIEvent.CLOSE,this._7416);
         if(this._8410)
         {
            this._8417._8410 = this._8410;
         }
         if(this._8412)
         {
            this._8417._8412 = this._8412;
         }
      }
      
      public function get _7438() : Boolean
      {
         if(this._8418)
         {
            return this._8418._1643;
         }
         return false;
      }
      
      ns_egret function set _7421(param1:Number) : void
      {
         this._8416 = param1;
      }
      
      ns_egret function get _7421() : Number
      {
         return this._8416;
      }
      
      override protected function _2476() : void
      {
         super._2476();
         if(this._7623)
         {
            this._7623 = false;
            this.ns_egret::_7430();
         }
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this._8410)
         {
            if(this._8418)
            {
               this._8418._8410 = this._8410;
            }
         }
         else if(param2 == this._8412 && Boolean(this._8418))
         {
            this._8418._8412 = this._8412;
         }
      }
      
      override protected function partRemoved(param1:String, param2:Object) : void
      {
         if(this._8418)
         {
            if(param2 == this._8410)
            {
               this._8418._8410 = null;
            }
            if(param2 == this._8412)
            {
               this._8418._8412 = null;
            }
         }
         super.partRemoved(param1,param2);
      }
      
      override protected function _6231() : String
      {
         return !enabled ? "disabled" : (this._7438 ? "open" : "normal");
      }
      
      override protected function _2477(param1:Boolean = true) : Boolean
      {
         var _loc2_:Boolean = super._2477(param1);
         this.ns_egret::_7430();
         return _loc2_;
      }
      
      override ns_egret function _2471(param1:int) : Boolean
      {
         return this.ns_egret::_7421 == param1;
      }
      
      public function _6629() : void
      {
         this._8418._6629();
      }
      
      public function _7440(param1:Boolean) : void
      {
         this._8418._7440(param1);
      }
      
      ns_egret function _7430(param1:* = undefined) : void
      {
      }
      
      ns_egret function _7419(param1:int, param2:Boolean = false) : void
      {
         _2483(this.ns_egret::_7421,false);
         this.ns_egret::_7421 = param1;
         _2483(this.ns_egret::_7421,true);
      }
      
      override protected function _2457(param1:CollectionEvent) : void
      {
         super._2457(param1);
         this._7623 = true;
         _2466();
      }
      
      override protected function _8099(param1:MouseEvent) : void
      {
         super._8099(param1);
         this.ns_egret::_7421 = selectedIndex;
         this._7440(true);
      }
      
      override protected function _8096(param1:MouseEvent) : void
      {
         param1.currentTarget.removeEventListener(MouseEvent.MOUSE_MOVE,this._8096);
      }
      
      ns_egret function _7417(param1:UIEvent) : void
      {
         addEventListener(UIEvent.UPDATE_COMPLETE,this.ns_egret::_8415);
         _2483(this.ns_egret::_7421,false);
         this.ns_egret::_7421 = selectedIndex;
         this.ns_egret::_7419(this.ns_egret::_7421);
         _2570();
      }
      
      ns_egret function _8415(param1:UIEvent) : void
      {
         removeEventListener(UIEvent.UPDATE_COMPLETE,this.ns_egret::_8415);
         dispatchEvent(new UIEvent(UIEvent.OPEN));
      }
      
      protected function _7416(param1:UIEvent) : void
      {
         addEventListener(UIEvent.UPDATE_COMPLETE,this._8414);
         _2570();
         if(!param1.isDefaultPrevented())
         {
            ns_egret::_2475(this.ns_egret::_7421,true);
         }
         else
         {
            this.ns_egret::_7419(selectedIndex);
         }
      }
      
      private function _8414(param1:UIEvent) : void
      {
         removeEventListener(UIEvent.UPDATE_COMPLETE,this._8414);
         dispatchEvent(new UIEvent(UIEvent.CLOSE));
      }
   }
}

