package _477
{
   import _120._121;
   import _609.HandleTransparentBgTask;
   
   public class _502 extends _494
   {
      private var _3707:Function;
      
      public function _502(param1:Function)
      {
         super();
         this._3707 = param1;
      }
      
      override public function run() : void
      {
         var _loc1_:HandleTransparentBgTask = new HandleTransparentBgTask();
         _loc1_.addEventListener(_121.COMPLETE,this.onComplete);
         _loc1_.addEventListener(_121.FAIL,this.onFail);
         _loc1_.run();
      }
      
      private function onFail(param1:_121) : void
      {
         fail(param1.data.type,param1.data.data);
      }
      
      private function onComplete(param1:_121) : void
      {
         if(this._3707 != null)
         {
            this._3707(_3613._3609._3690);
         }
         complete();
      }
   }
}

