package _11910
{
   import _11845._11949;
   
   public class _11945 extends _11944
   {
      public static const API:Number = 2;
      
      protected var _target:Object;
      
      protected var _12318:_11949;
      
      protected var _visible:Boolean;
      
      protected var _12317:Boolean;
      
      protected var _12270:int;
      
      public function _11945()
      {
         super("visible");
      }
      
      override public function _12284(param1:Object, param2:*, param3:_11949) : Boolean
      {
         this._target = param1;
         this._12318 = param3;
         this._12270 = !!this._12318.vars.runBackwards ? 0 : 1;
         this._12317 = this._target.visible;
         this._visible = Boolean(param2);
         return true;
      }
      
      override public function setRatio(param1:Number) : void
      {
         this._target.visible = param1 == 1 && (this._12318._12035 / this._12318._1892 == this._12270 || this._12318._1892 == 0) ? this._visible : this._12317;
      }
   }
}

