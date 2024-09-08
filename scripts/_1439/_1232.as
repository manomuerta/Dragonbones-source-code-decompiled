package _1439
{
   import _1045.DataGrid;
   import _1045.Grid;
   import _1045.Group;
   import _1045.Scroller;
   import _1045._1068;
   import _1045._1082;
   import _1045._1084;
   import _1049._1058;
   import _1374._1383;
   
   public class _1232 extends _1084
   {
      public var _2491:Scroller;
      
      public var grid:Grid;
      
      public var _7506:_1068;
      
      public var _7279:Class;
      
      public var _9060:Class;
      
      public var _7554:Class;
      
      public var selectionIndicator:Class;
      
      public var editorIndicator:Class;
      
      public var hoverIndicator:Class;
      
      public function _1232()
      {
         super();
         this.states = ["normal","disabled"];
      }
      
      override protected function _2438() : void
      {
         var _loc2_:Group = null;
         super._2438();
         this._7279 = ColumnSeparator;
         this._9060 = HeaderColumnSeparator;
         this._7554 = RowSeparator;
         this.selectionIndicator = SelectionIndicator;
         this.editorIndicator = EditorIndicator;
         this.hoverIndicator = HoverIndicator;
         var _loc1_:Group = new Group();
         _loc1_.top = _loc1_.left = _loc1_.right = _loc1_.bottom = 0;
         addElement(_loc1_);
         _loc2_ = new Group();
         _loc2_.left = _loc2_.right = _loc2_.bottom = 0;
         _loc2_.top = 23;
         _loc1_.addElement(_loc2_);
         var _loc3_:_1082 = new _1082();
         _loc3_.percentHeight = _loc3_.percentWidth = 100;
         _loc3_.fillColor = 2699835;
         _loc2_.addElement(_loc3_);
         this._2491 = new Scroller();
         this._2491._6243 = 0;
         this._2491._6182 = "auto";
         this._2491.percentHeight = 100;
         this._2491.percentWidth = 100;
         _loc2_.addElement(this._2491);
         this.grid = new Grid();
         this.grid.resizableColumns = true;
         this.grid.itemRenderer = _1057;
         var _loc4_:_1058;
         (_loc4_ = new _1058()).name = "backgroundLayer";
         this.grid.addElement(_loc4_);
         (_loc4_ = new _1058()).name = "selectionLayer";
         this.grid.addElement(_loc4_);
         (_loc4_ = new _1058()).name = "editorIndicatorLayer";
         this.grid.addElement(_loc4_);
         (_loc4_ = new _1058()).name = "rendererLayer";
         this.grid.addElement(_loc4_);
         (_loc4_ = new _1058()).name = "overlayLayer";
         this.grid.addElement(_loc4_);
         this._2491.viewport = this.grid;
         this._7506 = new _1068();
         this._7506.percentWidth = 100;
         this._7506.minHeight = 24;
         this._7506._7279 = ColumnSeparator;
         this._7506._7817 = _1383;
         _loc1_.addElement(this._7506);
         var _loc5_:_1082;
         (_loc5_ = new _1082()).mouseEnabled = false;
         _loc5_._2529 = 0;
         _loc5_._2564 = 1;
         _loc5_._2563 = 1777701;
         _loc5_.left = _loc5_.top = 0;
         _loc5_.right = _loc5_.bottom = 0;
         this.addElement(_loc5_);
         if(!DataGrid(_6081)._6573)
         {
            (_6081 as DataGrid)._6573 = ItemEditor;
         }
      }
   }
}

import _1045._1082;

class SelectionIndicator extends _1082
{
   public function SelectionIndicator()
   {
      super();
      fillColor = 3762325;
   }
}

import _1045._1082;

class HoverIndicator extends _1082
{
   public function HoverIndicator()
   {
      super();
      fillColor = 3687762;
   }
}

import _1045._1082;

class EditorIndicator extends _1082
{
   public function EditorIndicator()
   {
      super();
      fillColor = 16777215;
   }
}

import _1045._1082;

class RowSeparator extends _1082
{
   public function RowSeparator()
   {
      super();
      height = 1;
      fillColor = 1777701;
   }
}

import _1045._1082;

class HeaderColumnSeparator extends _1082
{
   public function HeaderColumnSeparator()
   {
      super();
      width = 1;
      fillColor = 1777701;
   }
}

import _1045._1082;

class ColumnSeparator extends _1082
{
   public function ColumnSeparator()
   {
      super();
      width = 1;
      fillColor = 1777701;
   }
}

import _1049._1057;
import _1439._1449;

class _1057 extends _1049._1057
{
   public function _1057()
   {
      super();
      this.skinName = _1449;
   }
}

import _1049._1052;
import _1439._1264;

class ItemEditor extends _1052
{
   public function ItemEditor()
   {
      super();
      this.skinName = _1264;
   }
}

