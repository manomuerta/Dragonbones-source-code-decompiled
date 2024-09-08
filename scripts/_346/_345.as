package _346
{
   import _6._8;
   import _668._671;
   import _93._92;
   
   public class _345 extends _92
   {
      public function _345()
      {
         super();
         _2219 = false;
         _2215 = false;
      }
      
      override public function execute() : void
      {
         var _loc2_:_8 = null;
         var _loc3_:_369 = null;
         var _loc4_:_11494 = null;
         var _loc1_:_671 = _2214._1844;
         if(Boolean(_loc1_) && Boolean(_loc1_._2871))
         {
            if(_loc1_._2871._3543)
            {
               _loc3_ = new _369();
               _loc3_._1572(_loc1_);
               _loc3_.execute();
            }
            else
            {
               _loc4_ = new _11494();
               _loc4_._1572(_loc1_.path);
               _loc4_.execute();
            }
         }
      }
   }
}

