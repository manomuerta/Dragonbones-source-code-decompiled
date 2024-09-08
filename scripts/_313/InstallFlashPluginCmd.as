package _313
{
   import _11111._11110;
   import _93._92;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.filesystem.File;
   
   public class InstallFlashPluginCmd extends _92
   {
      protected var file:File;
      
      protected var path:String = "others/DragonBonesDesignPanel/installPanel.jsfl";
      
      public function InstallFlashPluginCmd()
      {
         this.file = new File();
         super();
      }
      
      override public function _1572(param1:*) : void
      {
         super._2223 = param1;
         this.file = File.applicationDirectory.resolvePath(this.path);
      }
      
      override public function execute() : void
      {
         super.execute();
         if(this.file.exists)
         {
            this.file.addEventListener(IOErrorEvent.IO_ERROR,this._10501);
            this.file.addEventListener(ErrorEvent.ERROR,this._10501);
            try
            {
               this.file.openWithDefaultApplication();
            }
            catch(e:Error)
            {
               _11110.instance._11204._11132("InstallFlashPluginCmd::execute",e);
            }
         }
      }
      
      private function _10501(param1:Event) : void
      {
      }
   }
}

