package _346
{
   import _1404._1407;
   import _579._581;
   import _93._92;
   import egret.utils.FileUtil;
   
   public class _364 extends _92
   {
      public function _364()
      {
         super();
         _2219 = false;
         _2215 = false;
      }
      
      override public function _1572(param1:*) : void
      {
         param1 = FileUtil.escapePath(param1);
         super._1572(param1);
      }
      
      protected function get projectName() : String
      {
         return FileUtil.getFileName(_2223);
      }
      
      protected function get _3280() : String
      {
         return FileUtil.getDirectory(_2223);
      }
      
      protected function get projectPath() : String
      {
         return _2223;
      }
      
      protected function get _3219() : _581
      {
         return _1407.getInstance(_581) as _581;
      }
   }
}

