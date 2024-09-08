package _346
{
   import _11111._11110;
   import _93._92;
   import _97._101;
   import egret.utils.tr;
   import flash.events.Event;
   import flash.filesystem.File;
   import flash.net.FileFilter;
   
   public class ShowOpenProjectDialogCmd extends _92
   {
      public function ShowOpenProjectDialogCmd()
      {
         super();
      }
      
      override public function execute() : void
      {
         var file:File = null;
         var txtFilter:FileFilter = null;
         try
         {
            file = new File();
            txtFilter = new FileFilter("dragonBones","*" + _101.PROJECT_SUFFIX);
            file.browseForOpen(tr("Menu.File.OpenProject"),[txtFilter]);
            file.addEventListener(Event.SELECT,this.onSelect);
         }
         catch(e:Error)
         {
            _11110.instance._11204._11132("ShowOpenProjectDialogCmd::execute",e);
         }
      }
      
      private function onSelect(param1:Event) : void
      {
         var _loc2_:_361 = new _361();
         _loc2_._1572(File(param1.target).url);
         _loc2_.execute();
         _11110.instance._11564._11132();
      }
   }
}

