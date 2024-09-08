package _741
{
   import _1374.Alert;
   import egret.utils.tr;
   import flash.filesystem.File;
   
   public class _750
   {
      public static var _14739:Boolean = false;
      
      public function _750()
      {
         super();
      }
      
      public static function _5901(param1:*, param2:String = null) : _746
      {
         var proxy:_746 = null;
         var f:File = null;
         var extension:String = null;
         var path:String = null;
         var file:File = null;
         var content:* = param1;
         var _5851:String = param2;
         if(content is File)
         {
            f = content as File;
            if(f.isDirectory)
            {
               proxy = new _745(f,_5851);
            }
            else
            {
               extension = f.extension.toLowerCase();
               switch(extension)
               {
                  case "json":
                     proxy = new _748(f,_5851);
                     break;
                  case "png":
                     proxy = new _749(f,_5851);
                     break;
                  case "svg":
                     proxy = new _14089(f,_5851);
                     break;
                  case "amf3":
                     proxy = new _740(f,_5851);
                     break;
                  case "xml":
                     proxy = new _752(f,_5851);
                     break;
                  case "dbswf":
                     proxy = new _743(f,_5851);
                     break;
                  case "jpg":
                  case "jpeg":
                     proxy = new _747(f,_5851);
                     break;
                  case "swf":
                     proxy = new _14090(f,_5851);
               }
            }
         }
         else if(content is String)
         {
            path = content as String;
            file = File.applicationDirectory.resolvePath(path);
            if(Boolean(file.exists) && Boolean(file.isDirectory))
            {
               proxy = new _751(file);
            }
            else
            {
               try
               {
                  file.createDirectory();
                  proxy = new _751(file);
               }
               catch(e:Error)
               {
                  _14739 = true;
                  Alert.show(tr("FolderFactory.alert.tip",content));
               }
            }
         }
         return proxy;
      }
   }
}

