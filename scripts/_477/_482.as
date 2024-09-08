package _477
{
   import _1177.CloseEvent;
   import _1374.Alert;
   import egret.utils.tr;
   
   public class _482 extends _494
   {
      public function _482()
      {
         super();
      }
      
      override public function run() : void
      {
         var _3616:Object;
         var conflictArr:Array;
         var i:int;
         var len:int;
         var _2503:Function;
         var imageObj:Object = null;
         var confirmLabel:String = null;
         var cancelLabel:String = null;
         var alert:Alert = null;
         if(_3613._3609 == null || _3613._3609.images == null)
         {
            complete();
            return;
         }
         _3616 = {};
         conflictArr = [];
         i = 0;
         len = int(_3613._3609.images.length);
         while(i < len)
         {
            imageObj = _3613._3609.images[i];
            if(_3616[imageObj.name])
            {
               if(conflictArr.indexOf(imageObj.name) == -1)
               {
                  conflictArr.push(imageObj.name);
               }
            }
            else
            {
               _3616[imageObj.name] = true;
            }
            i++;
         }
         if(conflictArr.length > 0 && !ExportController._14446)
         {
            _2503 = function(param1:CloseEvent):void
            {
               if(param1.detail == Alert.SECOND_BUTTON)
               {
                  ExportController._14446 = true;
                  complete();
               }
               else
               {
                  fail(ExportController.EXPORT_ERROR_NAME_CONFLICT);
               }
            };
            confirmLabel = tr("Export.alert.confirm");
            cancelLabel = tr("Export.alert.cancel");
            alert = Alert.show(tr("Export.alert.nameConflict",conflictArr.join(",")),"",null,_2503,confirmLabel,cancelLabel);
         }
         else
         {
            complete();
         }
      }
   }
}

