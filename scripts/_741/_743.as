package _741
{
   import egret.utils.FileUtil;
   import flash.filesystem.File;
   import flash.utils.ByteArray;
   
   public class _743 extends _744
   {
      public function _743(param1:File, param2:String)
      {
         super(param1,param2);
      }
      
      override public function get data() : *
      {
         var _loc1_:ByteArray = null;
         try
         {
            _loc1_ = FileUtil.openAsByteArray(_file.nativePath);
            _data = _loc1_;
         }
         catch(e:Error)
         {
         }
         return _data;
      }
      
      override protected function _5914() : String
      {
         var _loc1_:String = super._5914();
         return _loc1_ + "." + _3261;
      }
   }
}

