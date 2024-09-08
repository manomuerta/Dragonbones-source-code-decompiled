package _346
{
   import _93._92;
   import _97._117;
   import flash.display.BitmapData;
   import flash.filesystem.File;
   
   public class _10606 extends _92
   {
      public function _10606()
      {
         super();
      }
      
      override public function execute() : void
      {
         var _loc1_:String = null;
         var _loc2_:File = null;
         var _loc3_:BitmapData = null;
         if(_2214._1844)
         {
            if(_2212 && _2212.stageView && _2214._1844 && Boolean(_2214._1844._2871))
            {
               _loc1_ = _2214._1844.path.replace(/(\/)/g,"_").replace(":","").replace(".","");
               if(_2223)
               {
                  if(_117._10678.hasOwnProperty(_loc1_))
                  {
                     return;
                  }
                  _loc2_ = File.applicationStorageDirectory.resolvePath("recent/" + _loc1_ + ".png");
                  if(_loc2_.exists)
                  {
                     return;
                  }
                  _117._11125 = true;
               }
               else
               {
                  _loc3_ = new BitmapData(_2212.stageView.width,_2212.stageView.height);
                  _loc3_.draw(_2212.stageView);
                  _2214._1844._2871._10703 = _loc3_;
                  _117._10677(_loc1_,_loc3_);
               }
            }
            else if(_2223)
            {
               _117._11125 = true;
            }
         }
      }
   }
}

