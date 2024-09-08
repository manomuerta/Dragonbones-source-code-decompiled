package _1049
{
   import _1038._1039;
   import _1038._1040;
   import _1045.Grid;
   import _1177.CollectionEvent;
   import _1177._1178;
   import egret.core.ns_egret;
   import flash.geom.Rectangle;
   
   use namespace ns_egret;
   
   public class _1062
   {
      private var cellRegions:Vector.<_8007>;
      
      private var _2484:Object;
      
      private var inCollectionHandler:Boolean;
      
      private var _7829:Grid;
      
      private var _preserveSelection:Boolean = true;
      
      private var _8006:Boolean = false;
      
      private var _selectionLength:int = 0;
      
      private var _selectionMode:String;
      
      public function _1062()
      {
         this.cellRegions = new Vector.<_8007>();
         this._selectionMode = _1063._7565;
         super();
      }
      
      public function get grid() : Grid
      {
         return this._7829;
      }
      
      public function set grid(param1:Grid) : void
      {
         this._7829 = param1;
      }
      
      public function get preserveSelection() : Boolean
      {
         return this._preserveSelection;
      }
      
      public function set preserveSelection(param1:Boolean) : void
      {
         if(this._preserveSelection == param1)
         {
            return;
         }
         this._preserveSelection = param1;
         this._2484 = null;
         if(this._preserveSelection && (this._6609 == _1063._7565 || this._6609 == _1063._7562) && this._7526 > 0)
         {
            if(this._6609 == _1063._7565)
            {
               this._2484 = this.grid.dataProvider.getItemAt(this.allRows()[0]);
            }
            else
            {
               this._2484 = this.grid.dataProvider.getItemAt(this.allCells()[0]._6589);
            }
         }
      }
      
      public function get _6678() : Boolean
      {
         return this._8006;
      }
      
      public function set _6678(param1:Boolean) : void
      {
         if(this._8006 == param1)
         {
            return;
         }
         this._8006 = param1;
         if(this._8006)
         {
            this.ensureRequiredSelection();
         }
      }
      
      public function get _7526() : int
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:_8007 = null;
         var _loc5_:int = 0;
         var _loc1_:Boolean = this._7504();
         if(this._selectionLength < 0)
         {
            this._selectionLength = 0;
            _loc2_ = int(this.cellRegions.length);
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc4_ = this.cellRegions[_loc3_];
               _loc5_ = _loc1_ ? int(_loc4_.height) : int(_loc4_.height * _loc4_.width);
               if(_loc4_._6051)
               {
                  this._selectionLength += _loc5_;
               }
               else
               {
                  this._selectionLength -= _loc5_;
               }
               _loc3_++;
            }
         }
         return this._selectionLength;
      }
      
      public function get _6609() : String
      {
         return this._selectionMode;
      }
      
      public function set _6609(param1:String) : void
      {
         if(param1 == this._selectionMode)
         {
            return;
         }
         switch(param1)
         {
            case _1063._7565:
            case _1063._6608:
            case _1063._7562:
            case _1063._7538:
            case _1063.NONE:
               this._selectionMode = param1;
               this._6162();
         }
      }
      
      public function allCells() : Vector.<_1048>
      {
         var _loc7_:int = 0;
         var _loc1_:Vector.<_1048> = new Vector.<_1048>();
         if(!this._7496())
         {
            return _loc1_;
         }
         var _loc2_:Rectangle = this.getCellRegionsBounds();
         var _loc3_:int = _loc2_.left;
         var _loc4_:int = _loc2_.right;
         var _loc5_:int = _loc2_.bottom;
         var _loc6_:int = _loc2_.top;
         while(_loc6_ < _loc5_)
         {
            _loc7_ = _loc3_;
            while(_loc7_ < _loc4_)
            {
               if(this.regionsContainCell(_loc6_,_loc7_))
               {
                  _loc1_.push(new _1048(_loc6_,_loc7_));
               }
               _loc7_++;
            }
            _loc6_++;
         }
         return _loc1_;
      }
      
      public function allRows() : Vector.<int>
      {
         if(!this._7504())
         {
            return new Vector.<int>(0,true);
         }
         var _loc1_:Vector.<int> = new Vector.<int>();
         var _loc2_:Rectangle = this.getCellRegionsBounds();
         var _loc3_:int = _loc2_.bottom;
         var _loc4_:int = _loc2_.top;
         while(_loc4_ < _loc3_)
         {
            if(this.regionsContainCell(_loc4_,0))
            {
               _loc1_.push(_loc4_);
            }
            _loc4_++;
         }
         return _loc1_;
      }
      
      public function selectAll() : Boolean
      {
         var _loc2_:int = 0;
         var _loc1_:int = int(this.getGridDataProviderLength());
         if(this._6609 == _1063._6608)
         {
            return this.setRows(0,_loc1_);
         }
         if(this._6609 == _1063._7538)
         {
            _loc2_ = int(this.getGridColumnsLength());
            return this.setCellRegion(0,0,_loc1_,_loc2_);
         }
         return false;
      }
      
      public function _6162() : Boolean
      {
         var _loc1_:* = this._7526 > 0;
         this.removeSelection();
         return this.ensureRequiredSelection() || _loc1_;
      }
      
      public function containsRow(param1:int) : Boolean
      {
         if(!this.validateIndex(param1))
         {
            return false;
         }
         return this.regionsContainCell(param1,0);
      }
      
      public function containsRows(param1:Vector.<int>) : Boolean
      {
         var _loc2_:int = 0;
         if(!this.validateIndices(param1))
         {
            return false;
         }
         for each(_loc2_ in param1)
         {
            if(!this.regionsContainCell(_loc2_,0))
            {
               return false;
            }
         }
         return true;
      }
      
      public function setRow(param1:int) : Boolean
      {
         if(!this.validateIndex(param1))
         {
            return false;
         }
         this.internalSetCellRegion(param1);
         return true;
      }
      
      public function addRow(param1:int) : Boolean
      {
         if(!this.validateIndex(param1))
         {
            return false;
         }
         if(this._6609 != _1063._6608)
         {
            return false;
         }
         this.internalAddCell(param1);
         return true;
      }
      
      public function removeRow(param1:int) : Boolean
      {
         if(!this.validateIndex(param1))
         {
            return false;
         }
         if(this._6678 && this.containsRow(param1) && this._7526 == 1)
         {
            return false;
         }
         this.internalRemoveCell(param1);
         return true;
      }
      
      public function setRows(param1:int, param2:int) : Boolean
      {
         if(!this.validateRowRegion(param1,param2))
         {
            return false;
         }
         this.internalSetCellRegion(param1,0,param2,1);
         return true;
      }
      
      public function _7559(param1:int, param2:int) : Boolean
      {
         if(!this.validateCell(param1,param2))
         {
            return false;
         }
         return this.regionsContainCell(param1,param2);
      }
      
      public function containsCellRegion(param1:int, param2:int, param3:int, param4:int) : Boolean
      {
         var _loc9_:_8007 = null;
         var _loc10_:int = 0;
         if(!this.validateCellRegion(param1,param2,param3,param4))
         {
            return false;
         }
         if(param3 * param4 > this._7526)
         {
            return false;
         }
         var _loc5_:int = int(this.cellRegions.length);
         if(_loc5_ == 0)
         {
            return false;
         }
         if(_loc5_ == 1)
         {
            _loc9_ = this.cellRegions[0];
            return param1 >= _loc9_.top && param2 >= _loc9_.left && param1 + param3 <= _loc9_.bottom && param2 + param4 <= _loc9_.right;
         }
         var _loc6_:int = param1 + param3;
         var _loc7_:int = param2 + param4;
         var _loc8_:int = param1;
         while(_loc8_ < _loc6_)
         {
            _loc10_ = param2;
            while(_loc10_ < _loc7_)
            {
               if(!this._7559(_loc8_,_loc10_))
               {
                  return false;
               }
               _loc10_++;
            }
            _loc8_++;
         }
         return true;
      }
      
      public function setCell(param1:int, param2:int) : Boolean
      {
         if(!this.validateCell(param1,param2))
         {
            return false;
         }
         var _loc3_:Boolean = this.isColumnVisible(param2);
         if(_loc3_)
         {
            this.internalSetCellRegion(param1,param2,1,1);
         }
         return _loc3_;
      }
      
      public function addCell(param1:int, param2:int) : Boolean
      {
         if(!this.validateCellRegion(param1,param2,1,1))
         {
            return false;
         }
         var _loc3_:Boolean = this.isColumnVisible(param2);
         if(_loc3_)
         {
            this.internalAddCell(param1,param2);
         }
         return _loc3_;
      }
      
      public function removeCell(param1:int, param2:int) : Boolean
      {
         if(!this.validateCell(param1,param2))
         {
            return false;
         }
         if(this._6678 && this._7559(param1,param2) && this._7526 == 1)
         {
            return false;
         }
         this.internalRemoveCell(param1,param2);
         return true;
      }
      
      public function setCellRegion(param1:int, param2:int, param3:uint, param4:uint) : Boolean
      {
         var _loc9_:Boolean = false;
         if(!this.validateCellRegion(param1,param2,param3,param4))
         {
            return false;
         }
         this.removeSelection();
         var _loc5_:int = param2;
         var _loc6_:int = 0;
         var _loc7_:int = param2 + param4 - 1;
         var _loc8_:int = param2;
         while(_loc8_ <= _loc7_)
         {
            _loc9_ = this.isColumnVisible(_loc8_);
            if(_loc9_)
            {
               _loc6_++;
            }
            else
            {
               this.internalAddCellRegion(param1,_loc5_,param3,_loc6_);
               _loc6_ = 0;
               _loc5_ = _loc8_ + 1;
            }
            _loc8_++;
         }
         if(_loc6_ > 0)
         {
            this.internalAddCellRegion(param1,_loc5_,param3,_loc6_);
         }
         return true;
      }
      
      private function _7504() : Boolean
      {
         var _loc1_:String = this._6609;
         return _loc1_ == _1063._7565 || _loc1_ == _1063._6608;
      }
      
      private function _7496() : Boolean
      {
         var _loc1_:String = this._6609;
         return _loc1_ == _1063._7562 || _loc1_ == _1063._7538;
      }
      
      private function isColumnVisible(param1:int) : Boolean
      {
         return _1053(this.grid.columns.getItemAt(param1)).visible;
      }
      
      private function getGridColumnsLength() : uint
      {
         if(this.grid == null)
         {
            return 0;
         }
         var _loc1_:_1039 = this.grid.columns;
         return !!_loc1_ ? uint(_loc1_.length) : 0;
      }
      
      private function getGridDataProviderLength() : uint
      {
         if(this.grid == null)
         {
            return 0;
         }
         var _loc1_:_1039 = this.grid.dataProvider;
         return !!_loc1_ ? uint(_loc1_.length) : 0;
      }
      
      private function regionsContainCell(param1:int, param2:int) : Boolean
      {
         var _loc6_:_8007 = null;
         var _loc3_:int = int(this.cellRegions.length);
         var _loc4_:int = -1;
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc6_ = this.cellRegions[_loc5_];
            if(_loc6_._6051 && _loc6_._7559(param1,param2))
            {
               _loc4_ = _loc5_;
            }
            _loc5_++;
         }
         if(_loc4_ == -1)
         {
            return false;
         }
         _loc5_ = _loc4_ + 1;
         while(_loc5_ < _loc3_)
         {
            _loc6_ = this.cellRegions[_loc5_];
            if(!_loc6_._6051 && _loc6_._7559(param1,param2))
            {
               return false;
            }
            _loc5_++;
         }
         return true;
      }
      
      private function ensureRequiredSelection() : Boolean
      {
         var _loc1_:Boolean = false;
         if(!this._6678)
         {
            return false;
         }
         if(this.getGridDataProviderLength() == 0 || this.getGridColumnsLength() == 0)
         {
            return false;
         }
         if(this._7504())
         {
            if(this._7526 == 0)
            {
               _loc1_ = this.grid._2475(0);
            }
         }
         else if(this._7496())
         {
            if(this._7526 == 0)
            {
               _loc1_ = this.grid._7521(0,0);
            }
         }
         return _loc1_;
      }
      
      private function removeSelection() : void
      {
         this.cellRegions.length = 0;
         this._selectionLength = 0;
         this._2484 = null;
      }
      
      protected function validateIndex(param1:int) : Boolean
      {
         if(this.inCollectionHandler)
         {
            return true;
         }
         return this._7504() && param1 >= 0 && param1 < this.getGridDataProviderLength();
      }
      
      protected function validateIndices(param1:Vector.<int>) : Boolean
      {
         var _loc2_:int = 0;
         if(this._6609 == _1063._6608)
         {
            if(this.inCollectionHandler)
            {
               return true;
            }
            for each(_loc2_ in param1)
            {
               if(_loc2_ < 0 || _loc2_ >= this.getGridDataProviderLength())
               {
                  return false;
               }
            }
            return true;
         }
         return false;
      }
      
      protected function validateCell(param1:int, param2:int) : Boolean
      {
         if(this.inCollectionHandler)
         {
            return true;
         }
         return this._7496() && param1 >= 0 && param1 < this.getGridDataProviderLength() && param2 >= 0 && param2 < this.getGridColumnsLength();
      }
      
      protected function validateCellRegion(param1:int, param2:int, param3:int, param4:int) : Boolean
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         if(this._6609 == _1063._7538)
         {
            if(this.inCollectionHandler)
            {
               return true;
            }
            _loc5_ = int(this.getGridDataProviderLength());
            _loc6_ = int(this.getGridColumnsLength());
            return param1 >= 0 && param3 >= 0 && param1 + param3 <= _loc5_ && param2 >= 0 && param4 >= 0 && param2 + param4 <= _loc6_;
         }
         return false;
      }
      
      protected function validateRowRegion(param1:int, param2:int) : Boolean
      {
         var _loc3_:int = 0;
         if(this._6609 == _1063._6608)
         {
            if(this.inCollectionHandler)
            {
               return true;
            }
            _loc3_ = int(this.getGridDataProviderLength());
            return param1 >= 0 && param2 >= 0 && param1 + param2 <= _loc3_;
         }
         return false;
      }
      
      private function internalSetCellRegion(param1:int, param2:int = 0, param3:uint = 1, param4:uint = 1) : void
      {
         var _loc5_:_8007 = new _8007(param1,param2,param3,param4,true);
         this.removeSelection();
         this.cellRegions.push(_loc5_);
         this._selectionLength = param3 * param4;
         if(this.preserveSelection && (this._6609 == _1063._7565 || this._6609 == _1063._7562))
         {
            this._2484 = this.grid.dataProvider.getItemAt(param1);
         }
      }
      
      private function internalAddCellRegion(param1:int, param2:int = 0, param3:uint = 1, param4:uint = 1) : void
      {
         var _loc5_:_8007 = new _8007(param1,param2,param3,param4,true);
         this.cellRegions.push(_loc5_);
         this._selectionLength += param3 * param4;
      }
      
      private function internalAddCell(param1:int, param2:int = 0) : void
      {
         var _loc3_:_8007 = null;
         if(!this.regionsContainCell(param1,param2))
         {
            _loc3_ = new _8007(param1,param2,1,1,true);
            this.cellRegions.push(_loc3_);
            if(this._selectionLength >= 0)
            {
               ++this._selectionLength;
            }
         }
      }
      
      private function internalRemoveCell(param1:int, param2:int = 0) : void
      {
         var _loc3_:_8007 = null;
         if(this.regionsContainCell(param1,param2))
         {
            _loc3_ = new _8007(param1,param2,1,1,false);
            this.cellRegions.push(_loc3_);
            if(this._selectionLength >= 0)
            {
               --this._selectionLength;
            }
            this._2484 = null;
         }
      }
      
      private function getCellRegionsBounds() : Rectangle
      {
         var _loc4_:_8007 = null;
         var _loc1_:Rectangle = new Rectangle();
         var _loc2_:int = int(this.cellRegions.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = this.cellRegions[_loc3_];
            if(_loc4_._6051)
            {
               _loc1_ = _loc1_.union(_loc4_);
            }
            _loc3_++;
         }
         return _loc1_;
      }
      
      public function _7670(param1:CollectionEvent) : void
      {
         this.inCollectionHandler = true;
         switch(param1.kind)
         {
            case _1178.ADD:
               this._7948(param1);
               break;
            case _1178.MOVE:
               this.dataProviderCollectionMove(param1);
               break;
            case _1178.REFRESH:
               this.dataProviderCollectionRefresh(param1);
               break;
            case _1178.REMOVE:
               this._7932(param1);
               break;
            case _1178.REPLACE:
               this.dataProviderCollectionReplace(param1);
               break;
            case _1178.RESET:
               this._7935(param1);
               break;
            case _1178.UPDATE:
               this._7933(param1);
         }
         this.inCollectionHandler = false;
      }
      
      private function _7948(param1:CollectionEvent) : void
      {
         this.handleRowAdd(param1.location,param1.items.length);
         this.ensureRequiredSelection();
      }
      
      private function handleRowAdd(param1:int, param2:int = 1) : void
      {
         var _loc4_:int = 0;
         var _loc5_:_8007 = null;
         var _loc6_:_8007 = null;
         var _loc3_:int = 0;
         while(_loc3_ < param2)
         {
            _loc4_ = 0;
            while(_loc4_ < this.cellRegions.length)
            {
               _loc5_ = this.cellRegions[_loc4_];
               if(param1 <= _loc5_.y)
               {
                  ++_loc5_.y;
               }
               else if(param1 < _loc5_.bottom)
               {
                  _loc6_ = new _8007(param1 + 1,_loc5_.x,_loc5_.bottom - param1,_loc5_.width,_loc5_._6051);
                  _loc5_.height = param1 - _loc5_.y;
                  this.cellRegions.splice(++_loc4_,0,_loc6_);
                  this._selectionLength = -1;
               }
               _loc4_++;
            }
            _loc3_++;
         }
      }
      
      private function dataProviderCollectionMove(param1:CollectionEvent) : void
      {
         var _loc2_:int = param1.oldLocation;
         var _loc3_:int = param1.location;
         this.handleRowRemove(_loc2_);
         if(_loc3_ > _loc2_)
         {
            _loc3_--;
         }
         this.handleRowAdd(_loc3_);
      }
      
      private function dataProviderCollectionRefresh(param1:CollectionEvent) : void
      {
         this.handleRefreshAndReset(param1);
      }
      
      private function handleRefreshAndReset(param1:CollectionEvent) : void
      {
         var _loc2_:_1040 = null;
         var _loc3_:int = 0;
         var _loc4_:_1048 = null;
         if(this._2484)
         {
            _loc2_ = param1.currentTarget as _1040;
            if(Boolean(_loc2_) && _loc2_.getItemIndex(this._2484) != -1)
            {
               _loc3_ = this.grid.dataProvider.getItemIndex(this._2484);
               if(this._6609 == _1063._7565)
               {
                  this.internalSetCellRegion(_loc3_);
               }
               else
               {
                  _loc4_ = this.allCells()[0];
                  this.internalSetCellRegion(_loc3_,_loc4_.columnIndex);
               }
               return;
            }
         }
         this.removeSelection();
         this.ensureRequiredSelection();
      }
      
      private function _7932(param1:CollectionEvent) : void
      {
         if(this.getGridDataProviderLength() == 0)
         {
            this.removeSelection();
            return;
         }
         this.handleRowRemove(param1.location,param1.items.length);
         this.ensureRequiredSelection();
      }
      
      private function handleRowRemove(param1:int, param2:int = 1) : void
      {
         var _loc4_:int = 0;
         var _loc5_:_8007 = null;
         var _loc3_:int = 0;
         while(_loc3_ < param2)
         {
            _loc4_ = 0;
            while(_loc4_ < this.cellRegions.length)
            {
               _loc5_ = this.cellRegions[_loc4_];
               if(param1 < _loc5_.y)
               {
                  --_loc5_.y;
               }
               else if(param1 >= _loc5_.y && param1 < _loc5_.bottom)
               {
                  this._selectionLength = -1;
                  --_loc5_.height;
                  if(_loc5_.height == 0)
                  {
                     this.cellRegions.splice(_loc4_,1);
                     continue;
                  }
               }
               _loc4_++;
            }
            _loc3_++;
         }
      }
      
      private function dataProviderCollectionReplace(param1:CollectionEvent) : void
      {
      }
      
      private function _7935(param1:CollectionEvent) : void
      {
         this.handleRefreshAndReset(param1);
      }
      
      private function _7933(param1:CollectionEvent) : void
      {
      }
      
      public function _7677(param1:CollectionEvent) : void
      {
         this.inCollectionHandler = true;
         switch(param1.kind)
         {
            case _1178.ADD:
               this.columnsCollectionAdd(param1);
               break;
            case _1178.MOVE:
               this.columnsCollectionMove(param1);
               break;
            case _1178.REMOVE:
               this.columnsCollectionRemove(param1);
               break;
            case _1178.REPLACE:
            case _1178.UPDATE:
               break;
            case _1178.REFRESH:
               this.columnsCollectionRefresh(param1);
               break;
            case _1178.RESET:
               this.columnsCollectionReset(param1);
         }
         this.inCollectionHandler = false;
      }
      
      private function columnsCollectionAdd(param1:CollectionEvent) : void
      {
         if(!this._7496())
         {
            return;
         }
         this.handleColumnAdd(param1.location,param1.items.length);
         this.ensureRequiredSelection();
      }
      
      private function handleColumnAdd(param1:int, param2:int = 1) : void
      {
         var _loc4_:int = 0;
         var _loc5_:_8007 = null;
         var _loc6_:_8007 = null;
         var _loc3_:int = 0;
         while(_loc3_ < param2)
         {
            _loc4_ = 0;
            while(_loc4_ < this.cellRegions.length)
            {
               _loc5_ = this.cellRegions[_loc4_];
               if(param1 <= _loc5_.x)
               {
                  ++_loc5_.x;
               }
               else if(param1 < _loc5_.x)
               {
                  _loc6_ = new _8007(_loc5_.y,param1 + 1,_loc5_.height,_loc5_.right - param1,_loc5_._6051);
                  _loc5_.width = param1 - _loc5_.x;
                  this.cellRegions.splice(++_loc4_,0,_loc6_);
                  this._selectionLength = -1;
               }
               _loc4_++;
            }
            _loc3_++;
         }
      }
      
      private function columnsCollectionMove(param1:CollectionEvent) : void
      {
         if(!this._7496())
         {
            return;
         }
         var _loc2_:int = param1.oldLocation;
         var _loc3_:int = param1.location;
         this.handleColumnRemove(_loc2_);
         if(_loc3_ > _loc2_)
         {
            _loc3_--;
         }
         this.handleColumnAdd(_loc3_);
      }
      
      private function columnsCollectionRemove(param1:CollectionEvent) : void
      {
         if(!this._7496())
         {
            return;
         }
         if(this.getGridColumnsLength() == 0)
         {
            this.removeSelection();
            return;
         }
         this.handleColumnRemove(param1.location,param1.items.length);
         this.ensureRequiredSelection();
      }
      
      private function handleColumnRemove(param1:int, param2:int = 1) : void
      {
         var _loc4_:int = 0;
         var _loc5_:_8007 = null;
         var _loc3_:int = 0;
         while(_loc3_ < param2)
         {
            _loc4_ = 0;
            while(_loc4_ < this.cellRegions.length)
            {
               _loc5_ = this.cellRegions[_loc4_];
               if(param1 < _loc5_.x)
               {
                  --_loc5_.x;
               }
               else if(param1 >= _loc5_.x && param1 < _loc5_.right)
               {
                  this._selectionLength = -1;
                  --_loc5_.width;
                  if(_loc5_.width == 0)
                  {
                     this.cellRegions.splice(_loc4_,1);
                     continue;
                  }
               }
               _loc4_++;
            }
            _loc3_++;
         }
      }
      
      private function columnsCollectionRefresh(param1:CollectionEvent) : void
      {
         this.columnsCollectionReset(param1);
      }
      
      private function columnsCollectionReset(param1:CollectionEvent) : void
      {
         if(!this._7496())
         {
            return;
         }
         this.removeSelection();
         this.ensureRequiredSelection();
      }
   }
}

import flash.geom.Rectangle;

class _8007 extends Rectangle
{
   public var _6051:Boolean = false;
   
   public function _8007(param1:int, param2:int, param3:uint, param4:uint, param5:Boolean)
   {
      super(param2,param1,param4,param3);
      this._6051 = param5;
   }
   
   public function _7559(param1:int, param2:int) : Boolean
   {
      return contains(param2,param1);
   }
}

