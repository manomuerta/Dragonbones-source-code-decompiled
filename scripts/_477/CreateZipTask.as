package _477
{
   import _11111._11110;
   import _120._119;
   import egret.utils.FileUtil;
   import flash.utils.ByteArray;
   import zero.zip.Zip;
   
   public class CreateZipTask extends _119
   {
      public function CreateZipTask()
      {
         super();
      }
      
      override public function run() : void
      {
         var commonPath:String = null;
         var zip:Zip = null;
         var date:Date = null;
         var i:uint = 0;
         var l:uint = 0;
         var file:Object = null;
         var name:String = null;
         var data:* = undefined;
         var byteArray:ByteArray = null;
         var files:Array = !!this._11540 ? this._11540 as Array : null;
         if(!files || files.length == 0)
         {
            fail("Input data error.");
            return;
         }
         try
         {
            commonPath = this._11540.commonPath;
            zip = new Zip();
            date = new Date();
            i = 0;
            l = files.length;
            while(i < l)
            {
               file = files[i];
               name = file.path;
               data = file.data;
               name = FileUtil.getFileNameWithSuffix(name);
               if(data is ByteArray)
               {
                  zip.add(data,name,date);
               }
               else
               {
                  byteArray = new ByteArray();
                  if(data is String || data is XML)
                  {
                     byteArray.writeUTFBytes(data);
                  }
                  else
                  {
                     byteArray.writeObject(data);
                  }
                  zip.add(byteArray,name,date);
               }
               i++;
            }
            this._2222 = zip.encode();
            complete();
         }
         catch(e:Error)
         {
            _11110.instance._11204._11132("CreateZipTask::run",e);
            fail("Zip encode error.");
         }
      }
   }
}

