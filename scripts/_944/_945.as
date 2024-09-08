package _944
{
   import _1045.Group;
   import _127._136;
   import _872._1005;
   import flash.events.FocusEvent;
   import flash.events.TimerEvent;
   import flash.text.TextFormat;
   import flash.utils.Timer;
   
   public class _945 extends _136
   {
      public var _4980:Boolean = false;
      
      public var _11379:_1005;
      
      private var timer:Timer;
      
      public function _945()
      {
         this._11379 = new _1005();
         this.timer = new Timer(700,1);
         super();
         addEventListener(FocusEvent.FOCUS_IN,this._6701);
         addEventListener(FocusEvent.FOCUS_OUT,this._6700);
         this.timer.addEventListener(TimerEvent.TIMER,this._11476);
      }
      
      public function _11378() : void
      {
         this._3344();
         var _loc1_:TextFormat = new TextFormat();
         _loc1_.underline = true;
         _loc1_.size = 12;
         this._11379.textFormat = _loc1_;
         if(stage)
         {
            (root as Group).addElement(this._11379);
         }
      }
      
      public function _3344() : void
      {
         this._11379.visible = false;
         this._11477();
      }
      
      public function _3351(param1:Number, param2:Number, param3:String) : void
      {
         this._11379.x = param1;
         this._11379.y = param2;
         this._11379.showText = param3;
         this._11477();
         this.timer.start();
      }
      
      private function _11476(param1:TimerEvent) : void
      {
         this._11475();
      }
      
      private function _11475() : void
      {
         this._11379.visible = true;
      }
      
      private function _11477() : void
      {
         if(this.timer.running)
         {
            this.timer.reset();
         }
      }
      
      private function _6701(param1:FocusEvent) : void
      {
         this._4980 = true;
      }
      
      private function _6700(param1:FocusEvent) : void
      {
         this._4980 = false;
      }
   }
}

