package _97
{
   import _1008.TransformPanel;
   import _13212.SheetPanel;
   import _1404._1407;
   import _785.AnimationPanel;
   import _813.ComicOrderPanel;
   import _813.ComicPropertyPanel;
   import _856.CurvePanel;
   import _857.DrawOrderPanel;
   import _859.LibraryPanel;
   import _877.MeshPanel;
   import _906.PropertyPanel;
   import _929.ScenePanel;
   import _978.TimelinePanel;
   import avmplus.getQualifiedClassName;
   
   public class _116
   {
      private static var _2369:Object;
      
      public static const RESET:String = "Reset";
      
      public static const SCENE_PANEL:String = "ScenePanel";
      
      public static const LIBRARY_PANEL:String = "LibraryPanel";
      
      public static const PROPERTY_PANEL:String = "PropertyPanel";
      
      public static const TRANSFORM_PANEL:String = "TransformPanel";
      
      public static const DRAWORDER_PANEL:String = "DrawOrderPanel";
      
      public static const ANIMATION_PANEL:String = "AnimationPanel";
      
      public static const TIMELINE_PANEL:String = "TimelinePanel";
      
      public static const CURVE_PANEL:String = "CurvePanel";
      
      public static const MESH_PANEL:String = "MeshPanel";
      
      public static const COMIC_PANEL:String = "ComicPanel";
      
      public static const COMIC_ORDER_PANEL:String = "ComicOrderPanel";
      
      public static const SHEET_PANEL:String = "SheetPanel";
      
      public function _116()
      {
         super();
      }
      
      public static function get _2371() : Object
      {
         if(!_2369)
         {
            _2369 = {};
            _2369[SCENE_PANEL] = ScenePanel;
            _2369[LIBRARY_PANEL] = LibraryPanel;
            _2369[PROPERTY_PANEL] = PropertyPanel;
            _2369[TRANSFORM_PANEL] = TransformPanel;
            _2369[DRAWORDER_PANEL] = DrawOrderPanel;
            _2369[ANIMATION_PANEL] = AnimationPanel;
            _2369[TIMELINE_PANEL] = TimelinePanel;
            _2369[CURVE_PANEL] = CurvePanel;
            _2369[MESH_PANEL] = MeshPanel;
            _2369[COMIC_PANEL] = ComicPropertyPanel;
            _2369[COMIC_ORDER_PANEL] = ComicOrderPanel;
            _2369[SHEET_PANEL] = SheetPanel;
         }
         return _2369;
      }
      
      public static function getInstance(param1:String) : *
      {
         var _loc2_:Class = _2371[param1];
         if(_loc2_)
         {
            return _1407.getInstance(_loc2_);
         }
         return null;
      }
      
      private static function _2368(param1:String) : Class
      {
         return _2371[param1];
      }
      
      public static function _2246(param1:*) : String
      {
         var _loc2_:String = null;
         for(_loc2_ in _2371)
         {
            if(getQualifiedClassName(_2371[_loc2_]) == getQualifiedClassName(param1))
            {
               return _loc2_;
            }
         }
         return "";
      }
   }
}

