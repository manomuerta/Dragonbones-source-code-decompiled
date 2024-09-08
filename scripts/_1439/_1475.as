package _1439
{
   import _1045.Group;
   import _1045._1084;
   import _1185._1189;
   import _1185._1196;
   import flash.events.MouseEvent;
   
   public class _1475 extends _1084
   {
      private var _10022:Class;
      
      public var _9761:_1399;
      
      public var _2516:_1399;
      
      public function _1475()
      {
         this._10022 = _1475__10022;
         super();
         this.states = ["up","over","down","disabled"];
      }
      
      override protected function _2438() : void
      {
         super._2438();
         var _loc1_:Group = new Group();
         var _loc2_:_1189 = new _1189();
         _loc2_.verticalAlign = _1196.CONTENT_JUSTIFY;
         _loc2_.gap = 0;
         _loc1_.layout = _loc2_;
         this.addElement(_loc1_);
         this._9761 = new _1399();
         this._9761.addEventListener(MouseEvent.ROLL_OVER,this._8132);
         this._9761.addEventListener(MouseEvent.ROLL_OUT,this._8142);
         _loc1_.addElement(this._9761);
         this._2516 = new _1399();
         this._2516.skinName = _1474;
         this._2516.addEventListener(MouseEvent.ROLL_OVER,this._8132);
         this._2516.addEventListener(MouseEvent.ROLL_OUT,this._8142);
         this._2516.addEventListener(MouseEvent.CLICK,this._10054);
         _loc1_.addElement(this._2516);
      }
      
      protected function _10054(param1:MouseEvent) : void
      {
         param1.stopPropagation();
      }
      
      protected function _8142(param1:MouseEvent) : void
      {
         this._9761._9786 = false;
         this._2516._9786 = false;
      }
      
      protected function _8132(param1:MouseEvent) : void
      {
         this._9761._9786 = true;
         this._2516._9786 = true;
      }
      
      override protected function _2519() : void
      {
         super._2519();
         if(_2080 == "disabled")
         {
            this._9761.enabled = false;
         }
         else
         {
            this._9761.enabled = true;
         }
      }
   }
}

import _1374.IconButton;

class _1399 extends IconButton
{
   private var _9785:Boolean = false;
   
   public function _1399()
   {
      super();
   }
   
   public function get _9786() : Boolean
   {
      return this._9785;
   }
   
   public function set _9786(param1:Boolean) : void
   {
      if(this._9785 == param1)
      {
         return;
      }
      this._9785 = param1;
      _2570();
   }
   
   override protected function _6231() : String
   {
      if(Boolean(enabled) && Boolean(this._9785) && super._6231() != "down")
      {
         return "over";
      }
      return super._6231();
   }
}

