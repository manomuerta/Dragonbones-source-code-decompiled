package _12908
{
   import _1045.Label;
   import _1529._1528;
   import _1529._1530;
   import egret.utils.SystemInfo;
   
   public class _12909 extends Label
   {
      public function _12909(param1:String)
      {
         super();
         percentWidth = 100;
         size = 20;
         textAlign = "center";
         textColor = 14964310;
         _6080 = 1;
         text = param1;
         if(!SystemInfo.isMacOS && _1528.language == _1530.zh_CN)
         {
            fontFamily = "微软雅黑";
         }
      }
   }
}

