package _127
{
   import egret.core._1140;
   import flash.display.BitmapData;
   import flash.display.Graphics;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.geom.Point;
   
   public class _148 extends _1140
   {
      private var _2550:Class;
      
      private var _2553:Class;
      
      private var _2552:Class;
      
      private var _2554:Boolean = false;
      
      private var _2549:Point;
      
      public function _148()
      {
         this._2550 = _148__2550;
         this._2553 = _148__2553;
         this._2552 = _148__2552;
         super();
         this._2551(new this._2550().bitmapData);
         this.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDown);
         this.addEventListener(MouseEvent.ROLL_OVER,this.rollOver);
         this.addEventListener(MouseEvent.ROLL_OUT,this.rollOut);
      }
      
      private function mouseDown(param1:MouseEvent) : void
      {
         this._2549 = localToGlobal(new Point(0,0));
         this._2554 = true;
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this._2547);
         stage.addEventListener(MouseEvent.MOUSE_UP,this._2548);
         this._2551(new this._2553().bitmapData);
         this.dispatchEvent(new _147(_147._2545,_149._2546(this._2549,new Point(param1.stageX,param1.stageY))));
      }
      
      private function rollOver(param1:MouseEvent) : void
      {
         if(!this._2554)
         {
            this._2551(new this._2552().bitmapData);
         }
      }
      
      private function rollOut(param1:MouseEvent) : void
      {
         if(!this._2554)
         {
            this._2551(new this._2550().bitmapData);
         }
      }
      
      private function _2547(param1:MouseEvent) : void
      {
         var _loc2_:Number = _149._2546(this._2549,new Point(param1.stageX,param1.stageY));
         this.dispatchEvent(new _147(_147._2545,_loc2_));
      }
      
      private function _2548(param1:MouseEvent) : void
      {
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this._2547);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this._2548);
         this._2554 = false;
         this._2551(new this._2550().bitmapData);
         this.dispatchEvent(new _147(_147._2542));
      }
      
      private function _2551(param1:BitmapData) : void
      {
         var _loc2_:Graphics = this.graphics;
         _loc2_.clear();
         var _loc3_:Matrix = new Matrix();
         _loc3_.translate(-param1.width / 2,-param1.height / 2);
         _loc2_.beginBitmapFill(param1,_loc3_,true,true);
         _loc2_.drawRect(-param1.width / 2,-param1.height / 2,param1.width,param1.height);
         _loc2_.endFill();
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         super.enabled = param1;
         this.mouseEnabled = param1;
      }
   }
}

