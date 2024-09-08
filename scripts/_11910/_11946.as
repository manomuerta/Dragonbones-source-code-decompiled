package _11910
{
   import _11845.*;
   import flash.media.SoundTransform;
   
   public class _11946 extends _11944
   {
      public static const API:Number = 2;
      
      protected var _target:Object;
      
      protected var _12351:SoundTransform;
      
      public function _11946()
      {
         super("volume");
      }
      
      override public function _12284(param1:Object, param2:*, param3:_11949) : Boolean
      {
         if(isNaN(param2) || Boolean(param1.hasOwnProperty("volume")) || !param1.hasOwnProperty("soundTransform"))
         {
            return false;
         }
         this._target = param1;
         this._12351 = this._target.soundTransform;
         _12285(this._12351,"volume",this._12351.volume,param2,"volume");
         return true;
      }
      
      override public function setRatio(param1:Number) : void
      {
         super.setRatio(param1);
         this._target.soundTransform = this._12351;
      }
   }
}

