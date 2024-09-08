package _346
{
   import _1404._1407;
   import _579._582;
   import _668._671;
   import _97._117;
   import egret.utils.FileUtil;
   
   public class _363 extends _364
   {
      public var _10700:Boolean = true;
      
      public function _363()
      {
         super();
      }
      
      override public function execute() : void
      {
         if(this._10700 && !_117._11211)
         {
            _2214._10702(projectPath);
            this._4915._10701();
         }
         if(!_2214._11562(projectPath))
         {
            if(FileUtil.exists(projectPath))
            {
               _3219._3296(new _671(projectPath));
            }
         }
      }
      
      private function get _4915() : _582
      {
         return _1407.getInstance(_582) as _582;
      }
   }
}

