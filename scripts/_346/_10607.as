package _346
{
   import _1404._1407;
   import _579._582;
   
   public class _10607 extends _364
   {
      public function _10607()
      {
         super();
      }
      
      override public function execute() : void
      {
         if(Boolean(_2214.recentProjectPathList[0]) && projectPath == _2214.recentProjectPathList[0])
         {
            return;
         }
         _2214._10702(projectPath);
         this._4915._10701();
      }
      
      private function get _4915() : _582
      {
         return _1407.getInstance(_582) as _582;
      }
   }
}

