package _477
{
   import _120._121;
   import _120._123;
   import _51._50;
   
   public class _12458 extends _494
   {
      private var _3607:String;
      
      private var _12591:Array;
      
      public function _12458(param1:String, param2:Array)
      {
         super();
         this._3607 = param1;
         this._12591 = param2.concat();
      }
      
      override public function run() : void
      {
         var _loc5_:RenderAnimationFramesTask = null;
         _3613._3609._3610 = false;
         _3613._3609._3611 = false;
         var _loc1_:_123 = new _123();
         var _loc2_:_50 = _3238.dragonBonesVO._2107(this._3607);
         var _loc3_:int = 0;
         var _loc4_:int = int(this._12591.length);
         while(_loc3_ < _loc4_)
         {
            _loc5_ = new RenderAnimationFramesTask(this._3607,this._12591[_loc3_]);
            _loc1_._2389(_loc5_);
            _loc3_++;
         }
         _loc1_.addEventListener(_121.COMPLETE,this.onComplete);
         _loc1_.addEventListener(_121.FAIL,this.onFail);
         _loc1_.run();
      }
      
      private function onFail(param1:_121) : void
      {
         param1.target.removeEventListener(_121.COMPLETE,this.onComplete);
         param1.target.removeEventListener(_121.FAIL,this.onFail);
         fail(param1.data.type,param1.data.data);
      }
      
      private function onComplete(param1:_121) : void
      {
         param1.target.removeEventListener(_121.COMPLETE,this.onComplete);
         param1.target.removeEventListener(_121.FAIL,this.onFail);
         complete();
      }
   }
}

