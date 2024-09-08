package _648
{
   import _636.DBModelEvent;
   import _708._715;
   import _721._753;
   import _93._95;
   import _97._116;
   import flash.utils.Dictionary;
   
   public class _663 extends _95
   {
      private var _5780:Dictionary;
      
      public function _663()
      {
         var _loc1_:String = null;
         this._5780 = new Dictionary();
         super();
         for(_loc1_ in _116._2371)
         {
            this._5780[_loc1_] = new _753(_loc1_);
         }
      }
      
      public function _4816() : void
      {
         var _loc1_:_753 = null;
         for each(_loc1_ in this._5780)
         {
            _loc1_.visible = false;
         }
      }
      
      public function _5779(param1:String) : _753
      {
         return this._5780[param1] as _753;
      }
      
      public function _3213(param1:String) : void
      {
         var _loc2_:_753 = this._5780[param1];
         if(_loc2_)
         {
            _loc2_.visible = true;
            dispatchEvent(new DBModelEvent(DBModelEvent.PANEL_STATUS_CHANGED,_loc2_));
         }
      }
      
      public function closePanel(param1:String) : void
      {
         var _loc2_:_753 = this._5780[param1];
         if(_loc2_)
         {
            _loc2_.visible = false;
            dispatchEvent(new DBModelEvent(DBModelEvent.PANEL_STATUS_CHANGED,_loc2_));
         }
      }
      
      public function _5782(param1:String) : void
      {
         var _loc2_:_753 = this._5780[param1];
         if(_loc2_)
         {
            _loc2_.enabled = true;
         }
      }
      
      public function _5781(param1:String) : void
      {
         var _loc2_:_753 = this._5780[param1];
         if(_loc2_)
         {
            _loc2_.enabled = false;
         }
      }
      
      public function _4807(param1:_715) : void
      {
         if(param1 == _715.NULL)
         {
            this._5780[_116.TIMELINE_PANEL].enabled = false;
            this._5780[_116.ANIMATION_PANEL].enabled = false;
            this._5780[_116.LIBRARY_PANEL].enabled = false;
            this._5780[_116.DRAWORDER_PANEL].enabled = false;
            this._5780[_116.SCENE_PANEL].enabled = false;
            this._5780[_116.PROPERTY_PANEL].enabled = false;
            this._5780[_116.TRANSFORM_PANEL].enabled = false;
            this._5780[_116.CURVE_PANEL].enabled = false;
            this._5780[_116.MESH_PANEL].enabled = false;
            this._5780[_116.COMIC_PANEL].enabled = false;
            this._5780[_116.COMIC_ORDER_PANEL].enabled = false;
            this._5780[_116.SHEET_PANEL].enabled = false;
         }
         else
         {
            this._5780[_116.PROPERTY_PANEL].enabled = true;
            this._5780[_116.SHEET_PANEL].enabled = false;
            if(param1 == _715.GENERAL)
            {
               this._5780[_116.SCENE_PANEL].enabled = false;
               this._5780[_116.TIMELINE_PANEL].enabled = true;
               this._5780[_116.ANIMATION_PANEL].enabled = true;
               this._5780[_116.CURVE_PANEL].enabled = true;
               this._5780[_116.MESH_PANEL].enabled = false;
               this._5780[_116.LIBRARY_PANEL].enabled = true;
               this._5780[_116.DRAWORDER_PANEL].enabled = false;
               this._5780[_116.COMIC_PANEL].enabled = false;
               this._5780[_116.COMIC_ORDER_PANEL].enabled = false;
               this._5780[_116.TRANSFORM_PANEL].enabled = false;
            }
            if(param1 == _715.ARMATURE)
            {
               this._5780[_116.SCENE_PANEL].enabled = true;
               this._5780[_116.TIMELINE_PANEL].enabled = false;
               this._5780[_116.ANIMATION_PANEL].enabled = false;
               this._5780[_116.CURVE_PANEL].enabled = false;
               this._5780[_116.MESH_PANEL].enabled = true;
               this._5780[_116.LIBRARY_PANEL].enabled = true;
               this._5780[_116.DRAWORDER_PANEL].enabled = true;
               this._5780[_116.COMIC_PANEL].enabled = false;
               this._5780[_116.COMIC_ORDER_PANEL].enabled = false;
               this._5780[_116.TRANSFORM_PANEL].enabled = false;
            }
            else if(param1 == _715.ANIMATE)
            {
               this._5780[_116.SCENE_PANEL].enabled = true;
               this._5780[_116.TIMELINE_PANEL].enabled = true;
               this._5780[_116.ANIMATION_PANEL].enabled = true;
               this._5780[_116.CURVE_PANEL].enabled = true;
               this._5780[_116.MESH_PANEL].enabled = false;
               this._5780[_116.LIBRARY_PANEL].enabled = false;
               this._5780[_116.DRAWORDER_PANEL].enabled = true;
               this._5780[_116.COMIC_PANEL].enabled = false;
               this._5780[_116.COMIC_ORDER_PANEL].enabled = false;
               this._5780[_116.TRANSFORM_PANEL].enabled = false;
            }
            else if(param1 == _715.COMIC)
            {
               this._5780[_116.SCENE_PANEL].enabled = false;
               this._5780[_116.TIMELINE_PANEL].enabled = false;
               this._5780[_116.ANIMATION_PANEL].enabled = false;
               this._5780[_116.CURVE_PANEL].enabled = false;
               this._5780[_116.MESH_PANEL].enabled = false;
               this._5780[_116.LIBRARY_PANEL].enabled = false;
               this._5780[_116.DRAWORDER_PANEL].enabled = false;
               this._5780[_116.PROPERTY_PANEL].enabled = false;
               this._5780[_116.TRANSFORM_PANEL].enabled = true;
               this._5780[_116.COMIC_PANEL].enabled = true;
               this._5780[_116.COMIC_ORDER_PANEL].enabled = true;
               this._5780[_116.TRANSFORM_PANEL].enabled = true;
            }
            else if(param1 == _715.SHEET)
            {
               this._5780[_116.SCENE_PANEL].enabled = false;
               this._5780[_116.TIMELINE_PANEL].enabled = false;
               this._5780[_116.ANIMATION_PANEL].enabled = false;
               this._5780[_116.CURVE_PANEL].enabled = false;
               this._5780[_116.MESH_PANEL].enabled = false;
               this._5780[_116.LIBRARY_PANEL].enabled = true;
               this._5780[_116.DRAWORDER_PANEL].enabled = false;
               this._5780[_116.TRANSFORM_PANEL].enabled = false;
               this._5780[_116.COMIC_PANEL].enabled = false;
               this._5780[_116.COMIC_ORDER_PANEL].enabled = false;
               this._5780[_116.TRANSFORM_PANEL].enabled = false;
               this._5780[_116.SHEET_PANEL].enabled = true;
            }
         }
      }
   }
}

