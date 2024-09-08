package _872
{
   import _1045.Group;
   import _1374.TabGroup;
   import _1374.TabPanel;
   import _1374._1382;
   import _1374._1396;
   import _1376.BoxElement;
   import _1376._1379;
   import _1421.BoxContainerEvent;
   import _636.DBPanelEvent;
   import _97._96;
   import flash.display.DisplayObject;
   
   public class _888 extends Group
   {
      private var _6481:_1382;
      
      private var layoutChanged:Boolean = false;
      
      public function _888()
      {
         super();
         this.left = this.right = this.top = this.bottom = 0;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._6481 = new _1382();
         this._6481._4833 = new _1382();
         this._6481._4833._6483 = true;
         this._6481.addEventListener(BoxContainerEvent.BOX_DRAG_COMPLETE,this._6479);
         this._6481.left = this._6481.right = -1;
         this._6481.top = 0;
         this._6481.bottom = 0;
         addElement(this._6481);
      }
      
      override protected function _2476() : void
      {
         super._2476();
         if(this.layoutChanged)
         {
            this.layoutChanged = false;
            dispatchEvent(new DBPanelEvent(DBPanelEvent.LAYOUT_CHANGED));
         }
      }
      
      protected function _6479(param1:BoxContainerEvent) : void
      {
         this._4812();
      }
      
      public function closePanel(param1:_1396) : _1396
      {
         var _loc2_:TabGroup = param1.owner as TabGroup;
         if(_loc2_.contains(param1 as DisplayObject))
         {
            _loc2_.removeElement(param1);
         }
         if(_loc2_._2249 == 0)
         {
            if(this._6481.contains(_loc2_))
            {
               this._6481.removeElement(_loc2_);
            }
            return null;
         }
         return _loc2_._4827;
      }
      
      public function _4812() : void
      {
         this.layoutChanged = true;
         _2466();
      }
      
      public function _2239(param1:Boolean = false) : XML
      {
         return _96._2239(this._6481._4837,this._6481._4833._4837,param1);
      }
      
      public function _4815(param1:XML) : void
      {
         this._6481.removeElement(this._6481._4837);
         _96._2230(this._6481,this._6481._4833,param1);
      }
      
      public function _4810(param1:XML) : void
      {
         this._6481._4833.removeElement(this._6481._4833._4837);
         _96._2228(this._6481._4833,param1);
      }
      
      public function _6480(param1:String) : TabPanel
      {
         return this._6484(this._6481._4837,param1);
      }
      
      private function _6484(param1:_1379, param2:String) : TabPanel
      {
         var _loc3_:TabPanel = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(!param1)
         {
            return null;
         }
         if(param1 is BoxElement)
         {
            _loc3_ = this._6484(BoxElement(param1)._2247,param2);
            if(_loc3_)
            {
               return _loc3_;
            }
            return this._6484(BoxElement(param1)._2241,param2);
         }
         if(param1 is TabGroup)
         {
            _loc4_ = TabGroup(param1)._2249;
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               _loc3_ = TabGroup(param1).getElementAt(_loc5_) as TabPanel;
               if(_loc3_.title == param2)
               {
                  return _loc3_;
               }
               _loc5_++;
            }
         }
         return null;
      }
      
      public function _4832(param1:TabPanel) : void
      {
         if(!this._6481)
         {
            return;
         }
         var _loc2_:TabGroup = this._6482(this._6481._4837);
         if(!_loc2_)
         {
            _loc2_ = new TabGroup();
            this._6481.addElement(_loc2_);
         }
         _loc2_.addElement(param1);
      }
      
      private function _6482(param1:_1379) : TabGroup
      {
         var _loc2_:TabGroup = null;
         if(param1 is TabGroup && !param1.minimized)
         {
            return param1 as TabGroup;
         }
         if(param1 is BoxElement)
         {
            _loc2_ = this._6482(BoxElement(param1)._2247);
            if(_loc2_)
            {
               return _loc2_;
            }
            return this._6482(BoxElement(param1)._2241);
         }
         return null;
      }
      
      public function get _2245() : _1382
      {
         return this._6481;
      }
      
      public function get _4833() : _1382
      {
         if(!this._6481)
         {
            return null;
         }
         return this._6481._4833;
      }
   }
}

