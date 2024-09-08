package _877
{
   import egret.core._1140;
   
   public class _886 extends _1140
   {
      private const COLOR:uint = 65280;
      
      public function _886()
      {
         super();
         this.mouseChildren = this.mouseEnabled = false;
         this.graphics.beginFill(this.COLOR);
         this.graphics.drawCircle(0,0,5);
         this.graphics.endFill();
      }
   }
}

