package _11910
{
   import _11845._11949;
   import flash.display.MovieClip;
   
   public class _11925 extends _11926
   {
      public static const API:Number = 2;
      
      public function _11925()
      {
         super();
         _12315 = "frameLabel";
      }
      
      override public function _12284(param1:Object, param2:*, param3:_11949) : Boolean
      {
         if(!param3.target is MovieClip)
         {
            return false;
         }
         _target = param1 as MovieClip;
         this.frame = _target.currentFrame;
         var _loc4_:Array = _target.currentLabels;
         var _loc5_:String = param2;
         var _loc6_:int = _target.currentFrame;
         var _loc7_:int = int(_loc4_.length);
         while(--_loc7_ > -1)
         {
            if(_loc4_[_loc7_].name == _loc5_)
            {
               _loc6_ = int(_loc4_[_loc7_].frame);
               break;
            }
         }
         if(this.frame != _loc6_)
         {
            _12285(this,"frame",this.frame,_loc6_,"frame",true);
         }
         return true;
      }
   }
}

