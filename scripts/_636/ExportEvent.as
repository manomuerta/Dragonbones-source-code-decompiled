package _636
{
   import flash.events.Event;
   
   public class ExportEvent extends Event
   {
      public static var GIF_REPEAT:String = "ExportEvent:GIF_REPEAT";
      
      public static var GIF_QUALITY:String = "ExportEvent:GIF_QUALITY";
      
      public static var IS_PREVIEW:String = "ExportEvent:IS_PREVIEW";
      
      public static var HAS_BG_COLOR:String = "ExportEvent:HAS_BG_COLOR";
      
      public static var BG_COLOR_CHANGE:String = "ExportEvent:BG_COLOR_CHANGE";
      
      public static var SCALE_CHANGE:String = "ExportEvent:SCALE_CHANGE";
      
      public static var FRAME_RATE_CHANGE:String = "ExportEvent:FRAME_RATE_CHANGE";
      
      public static var IMAGE_TYPE_CHANGE:String = "ExportEvent:IMAGE_TYPE_CHANGE";
      
      public static var DATA_TYPE_CHANGE:String = "ExportEvent:DATA_TYPE_CHANGE";
      
      public static var DATA_VERSION_CHANGE:String = "ExportEvent:DATA_VERSION_CHANGE";
      
      public static var OPEN_TEXTURE_SETTING:String = "ExportEvent:OPEN_TEXTURE_SETTING";
      
      public static var IS_ZIP:String = "ExportEvent:IS_ZIP";
      
      public static var EXPORT_TYPE_CHANGE:String = "ExportEvent:EXPORT_TYPE_CHANGE";
      
      public static var ONLY_CUR_ANIMATION:String = "ExportEvent:ONLY_CUR_ANIMATION";
      
      public static var EXPORT_DATA:String = "ExportEvent:EXPORT_DATA";
      
      public static var EXPORT_TEXTURE:String = "ExportEvent:EXPORT_TEXTURE";
      
      public static var SUPERTYPE_CHANGE:String = "ExportEvent:SUPERTYPE_CHANGE";
      
      public static var IMAGE_PACKAGE_TYPE_CHANGE:String = "ExportEvent:IMAGE_PACKAGE_TYPE_CHANGE";
      
      public static var IMAGE_FORMAT_CHANGE:String = "ExportEvent:IMAGE_FORMAT_CHANGE";
      
      public static var IMAGE_SINGLE_CHANGE:String = "ExportEvent:IMAGE_SINGLE_CHANGE";
      
      public static var OPEN_PREVIEW_WINDOW:String = "ExportEvent:OPEN_PREVIEW_WINDOW";
      
      public static var PREVIEW_SINGLE_IMAGE:String = "ExportEvent:PREVIEW_SINGLE_IMAGE";
      
      public static var PREVIEW_IMAGES:String = "ExportEvent:PREVIEW_IMAGES";
      
      public static var SINGLE_FRAME_CHANGE:String = "ExportEvent:SINGLE_FRAME_CHANGE";
      
      public static var ANIMATIONS_CHANGE:String = "ExportEvent:ANIMATIONS_CHANGE";
      
      public static var REFRESH_PREVIEW_SINGLE:String = "ExportEvent:REFRESH_PREVIEW_SINGLE";
      
      public static var CHECK_MESH_EGRET:String = "ExportEvent:CHECK_MESH_EGRET";
      
      public static var WEB_SCALE_CHANGE:String = "ExportEvent:WEB_SCALE_CHANGE";
      
      public static var WEB_COLOR_CHANGE:String = "ExportEvent:WEB_COLOR_CHANGE";
      
      public static var WEB_GRID_CHANGE:String = "ExportEvent:WEB_GRID_CHANGE";
      
      public var data:*;
      
      public function ExportEvent(param1:String, param2:* = null, param3:Boolean = true, param4:Boolean = false)
      {
         super(param1,param3,param4);
         this.data = param2;
      }
      
      override public function clone() : Event
      {
         return new ExportEvent(this.type,this.data);
      }
   }
}

