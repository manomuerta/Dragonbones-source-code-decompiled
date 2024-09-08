package _11910
{
   import _11845._11949;
   
   public class _11909 extends _11944
   {
      public static const API:Number = 2;
      
      protected var _target:Object;
      
      protected var _12283:Boolean;
      
      public function _11909()
      {
         super("autoAlpha,alpha,visible");
      }
      
      override public function _12284(param1:Object, param2:*, param3:_11949) : Boolean
      {
         this._target = param1;
         _12285(param1,"alpha",param1.alpha,param2,"alpha");
         return true;
      }
      
      override public function _12037(param1:Object) : Boolean
      {
         this._12283 = "visible" in param1;
         return super._12037(param1);
      }
      
      override public function setRatio(param1:Number) : void
      {
         super.setRatio(param1);
         if(!this._12283)
         {
            this._target.visible = this._target.alpha != 0;
         }
      }
   }
}

