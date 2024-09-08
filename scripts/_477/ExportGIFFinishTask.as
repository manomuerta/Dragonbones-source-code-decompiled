package _477
{
   import _11111._11110;
   import flash.utils.ByteArray;
   
   public class ExportGIFFinishTask extends _494
   {
      private var _14465:ByteArray;
      
      private var _path:String;
      
      public function ExportGIFFinishTask(param1:ByteArray, param2:String)
      {
         super();
         this._14465 = param1;
         this._path = param2;
      }
      
      override public function run() : void
      {
         super.run();
         try
         {
            this._14465.uncompress();
            this._14465.position = 0;
            _3613._3676.push({
               "path":this._path,
               "data":this._14465
            });
            complete();
         }
         catch(e:Error)
         {
            _11110.instance._11204._11132("ExportGIFFinishTask::run",e);
            fail(ExportController.EXPORT_ERROR_UNKNOW,null);
         }
      }
   }
}

