package _12444
{
   import _214._213;
   import _51._70;
   import _93._92;
   
   public class _12445 extends _92
   {
      public function _12445()
      {
         super();
         _2215 = false;
         _2219 = true;
      }
      
      override public function execute() : void
      {
         super.execute();
         if(this.displayVO)
         {
            _213._12515(this.displayVO,this.libraryPath);
         }
      }
      
      private function get displayVO() : _70
      {
         return _2223.displayVO as _70;
      }
      
      private function get libraryPath() : String
      {
         return _2223.libraryPath as String;
      }
   }
}

