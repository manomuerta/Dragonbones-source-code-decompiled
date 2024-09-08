package _1009
{
   import _1045.Label;
   import _11111._11110;
   import _1374.Alert;
   import egret.utils.FileUtil;
   import egret.utils.SystemInfo;
   import egret.utils.tr;
   import flash.events.TextEvent;
   import flash.filesystem.File;
   
   public class ExportSuccessWindow extends Alert
   {
      public function ExportSuccessWindow()
      {
         super();
         title = tr("Export.success");
         _2499 = tr("Alert.Confirm");
      }
      
      override public function set _2505(param1:String) : void
      {
         super._2505 = param1;
         if(_2508)
         {
            (_2508 as Label).htmlText = "<p align=\'center\'>" + tr("Export.success_to") + "</p><a href=\'event:aa\'>" + _2505 + "</a>";
         }
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         var _loc3_:Label = null;
         super.partAdded(param1,param2);
         if(param2 == _2508)
         {
            _loc3_ = Label(_2508);
            _loc3_.leading = 5;
            _loc3_.addEventListener(TextEvent.LINK,this.linkHandler);
            _loc3_.htmlText = "<p align=\'center\'>" + tr("Export.success_to") + "</p><a href=\'event:aa\'>" + _2505 + "</a>";
            if(SystemInfo.isMacOS)
            {
               _loc3_.htmlText += "\n\n";
            }
         }
      }
      
      private function linkHandler(param1:TextEvent) : void
      {
         var file:File;
         var e:TextEvent = param1;
         var outputPath:String = _2505;
         if(outputPath == null)
         {
            return;
         }
         if(outputPath.lastIndexOf(".zip") != -1)
         {
            outputPath = FileUtil.getDirectory(outputPath);
         }
         file = new File(outputPath);
         if(Boolean(file.exists) && Boolean(file.isDirectory))
         {
            try
            {
               file.openWithDefaultApplication();
            }
            catch(e:Error)
            {
               _11110.instance._11204._11132("ExportSuccessWindow::linkHandler",e);
            }
         }
         this.close();
      }
   }
}

