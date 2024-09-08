package _11910
{
   import _11845._11949;
   import flash.display.MovieClip;
   
   public class _11926 extends _11944
   {
      public static const API:Number = 2;
      
      public var frame:int;
      
      protected var _target:MovieClip;
      
      public function _11926()
      {
         super("frame,frameLabel,frameForward,frameBackward");
      }
      
      override public function _12284(param1:Object, param2:*, param3:_11949) : Boolean
      {
         if(!(param1 is MovieClip) || isNaN(param2))
         {
            return false;
         }
         this._target = param1 as MovieClip;
         this.frame = this._target.currentFrame;
         _12285(this,"frame",this.frame,param2,"frame",true);
         return true;
      }
      
      override public function setRatio(param1:Number) : void
      {
         super.setRatio(param1);
         if(this.frame != this._target.currentFrame)
         {
            this._target.gotoAndStop(this.frame);
         }
      }
   }
}

