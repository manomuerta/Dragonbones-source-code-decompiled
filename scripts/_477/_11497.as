package _477
{
   import _97._118;
   
   public class _11497 extends _494
   {
      private var _3710:int;
      
      private var _3709:int;
      
      public function _11497()
      {
         super();
      }
      
      override public function run() : void
      {
         var _loc2_:int = 0;
         var _loc1_:int = int(_3613._3676.length);
         this._3710 = _loc1_;
         this._3709 = 0;
         if(_loc1_ > 0)
         {
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               _118.save(_3613._3676[_loc2_].path,_3613._3676[_loc2_].data,true,"",false,this._3682,this._3683);
               _loc2_++;
            }
         }
         else
         {
            fail(ExportController.EXPORT_ERROR_NO_DATA);
         }
      }
      
      private function _3683() : void
      {
         fail(ExportController.EXPORT_ERROR_SAVE_FILE);
         _3613._3676.length = 0;
      }
      
      private function _3682() : void
      {
         ++this._3709;
         if(this._3709 == this._3710)
         {
            complete();
         }
         _3613._3676.length = 0;
      }
   }
}

