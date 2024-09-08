package _1088
{
   import _1045._1072;
   import _1045._1105;
   import _1177.TreeEvent;
   import egret.core.ns_egret;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   use namespace ns_egret;
   
   public class TreeItemRenderer extends ItemRenderer implements _1072
   {
      public var _2448:_1105;
      
      public var _2615:_1102;
      
      public var _2440:DisplayObject;
      
      private var _8550:Number = 17;
      
      private var _6931:Object;
      
      private var _6942:int = 0;
      
      private var _6932:Boolean = false;
      
      private var _isOpen:Boolean = false;
      
      public function TreeItemRenderer()
      {
         super();
         addEventListener(MouseEvent.MOUSE_DOWN,this._8549,false,1000);
      }
      
      private function _8549(param1:MouseEvent) : void
      {
         if(param1.target == this._2615)
         {
            param1.stopImmediatePropagation();
         }
      }
      
      public function get _6070() : Number
      {
         return this._8550;
      }
      
      public function set _6070(param1:Number) : void
      {
         this._8550 = param1;
      }
      
      public function get _5988() : Object
      {
         return this._6931;
      }
      
      public function set _5988(param1:Object) : void
      {
         if(this._6931 == param1)
         {
            return;
         }
         this._6931 = param1;
         if(this._2448)
         {
            this._2448.source = this._6931;
         }
      }
      
      public function get depth() : int
      {
         return this._6942;
      }
      
      public function set depth(param1:int) : void
      {
         if(param1 == this._6942)
         {
            return;
         }
         this._6942 = param1;
         if(this._2440)
         {
            this._2440.x = this._6942 * this._8550;
         }
      }
      
      public function get _4521() : Boolean
      {
         return this._6932;
      }
      
      public function set _4521(param1:Boolean) : void
      {
         if(this._6932 == param1)
         {
            return;
         }
         this._6932 = param1;
         if(this._2615)
         {
            this._2615.visible = this._6932;
         }
      }
      
      public function get opened() : Boolean
      {
         return this._isOpen;
      }
      
      public function set opened(param1:Boolean) : void
      {
         if(this._isOpen == param1)
         {
            return;
         }
         this._isOpen = param1;
         if(this._2615)
         {
            this._2615.selected = this._isOpen;
         }
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this._2448)
         {
            this._2448.source = this._6931;
         }
         else if(param2 == this._2615)
         {
            this._2615.visible = this._6932;
            this._2615.selected = this._isOpen;
            this._2615.ns_egret::_8542 = false;
            this._2615.addEventListener(MouseEvent.MOUSE_DOWN,this._8548);
         }
         else if(param2 == this._2440)
         {
            this._2440.x = this._6942 * this._8550;
         }
      }
      
      override protected function partRemoved(param1:String, param2:Object) : void
      {
         super.partRemoved(param1,param2);
         if(param2 == this._2448)
         {
            this._2448.source = null;
         }
         else if(param2 == this._2615)
         {
            this._2615.removeEventListener(MouseEvent.MOUSE_DOWN,this._8548);
            this._2615.ns_egret::_8542 = true;
            this._2615.visible = true;
         }
      }
      
      protected function _8548(param1:MouseEvent) : void
      {
         var _loc2_:TreeEvent = new TreeEvent(TreeEvent.ITEM_OPENING,false,true,itemIndex,data,this);
         _loc2_.opening = !this._isOpen;
         dispatchEvent(_loc2_);
      }
   }
}

