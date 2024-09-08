package _127
{
   import egret.core._1140;
   import flash.display.BitmapData;
   import flash.display.Graphics;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.geom.Point;
   
   public class _14038 extends _1140
   {
      public static const LEFT:String = "left";
      
      public static const RIGHT:String = "right";
      
      private static const OUT:String = "out";
      
      private static const UP:String = "up";
      
      private static const DOWN:String = "down";
      
      private static const OVER:String = "over";
      
      private static const DIS:String = "DIS";
      
      private var _14333:Class;
      
      private var _14332:Class;
      
      private var _14331:String;
      
      private var _14330:BitmapData;
      
      private var _2549:Point;
      
      public function _14038()
      {
         this._14333 = _14038__14333;
         this._14332 = _14038__14332;
         super();
      }
      
      public function set type(param1:String) : void
      {
         if(param1 == _14038.LEFT)
         {
            this._14330 = new this._14333().bitmapData;
         }
         else
         {
            this._14330 = new this._14332().bitmapData;
         }
         this._2551(this._14330);
         this.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDown);
         this.addEventListener(MouseEvent.MOUSE_UP,this.mouseUp);
         this.addEventListener(MouseEvent.ROLL_OVER,this.rollOver);
         this.addEventListener(MouseEvent.ROLL_OUT,this.rollOut);
      }
      
      private function mouseDown(param1:MouseEvent) : void
      {
         this._2549 = localToGlobal(new Point(0,0));
         this._13011(DOWN);
      }
      
      private function mouseUp(param1:MouseEvent) : void
      {
         this._2549 = localToGlobal(new Point(0,0));
         this._13011(UP);
      }
      
      private function rollOver(param1:MouseEvent) : void
      {
         this._13011(OVER);
      }
      
      private function rollOut(param1:MouseEvent) : void
      {
         this._13011(OUT);
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
      
      private function _13011(param1:String = "non") : void
      {
         if(!this.enabled)
         {
            this.alpha = 0;
            this.scaleX = this.scaleY = 1;
            return;
         }
         this._14331 = param1;
         switch(param1)
         {
            case UP:
            case OUT:
               this.scaleX = this.scaleY = 1;
               this.alpha = 0.8;
               break;
            case DOWN:
               this.scaleX = this.scaleY = 0.8;
               this.alpha = 1;
               break;
            case OVER:
               this.scaleX = this.scaleY = 1;
               this.alpha = 1;
               break;
            case DIS:
               this.scaleX = this.scaleY = 1;
               this.alpha = 0;
               break;
            default:
               this.scaleX = this.scaleY = 1;
               this.alpha = 0.8;
         }
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         super.enabled = param1;
         this.mouseEnabled = param1;
         if(param1)
         {
            this._13011();
         }
         else
         {
            this._13011(DIS);
         }
      }
   }
}

