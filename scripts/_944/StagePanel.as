package _944
{
   import _1038._1037;
   import _11106._11108;
   import _11111._11110;
   import _11254._11255;
   import _1177.IndexChangeEvent;
   import _1374.IconButton;
   import _1374.TabPanel;
   import _1374._1391;
   import _636.DBModelEvent;
   import _636.DBPanelEvent;
   import _648._665;
   import _668._671;
   import _708._715;
   import _708._716;
   import _822._855;
   import _877._11511;
   import _953.StageFilterBar;
   import _953._10624;
   import _953._13221;
   import _953._960;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class StagePanel extends TabPanel
   {
      public var _4895:_1391;
      
      public var _4905:_1391;
      
      public var _4904:StageFilterBar;
      
      public var _10765:_10624;
      
      public var _11369:_11255;
      
      public var _11651:_11511;
      
      public var _4883:_855;
      
      public var stageView:_960;
      
      public var _6689:IconButton;
      
      public var _6694:Object;
      
      public var sheetPanel:_13221;
      
      public function StagePanel()
      {
         super();
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         this.width = param1;
         this.height = param2;
         super._5823(param1,param2);
         if(this.stageView)
         {
            this.stageView._6695(width,height);
         }
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         var _loc3_:Object = null;
         super.partAdded(param1,param2);
         if(param2 == this._4895)
         {
            this._4895.selectedIndex = 0;
            this._4895.addEventListener(IndexChangeEvent.CHANGE,this._6691);
         }
         else if(param2 == this._4905)
         {
            this._4905.addEventListener(IndexChangeEvent.CHANGE,this._6408);
            if(!this._6694)
            {
               for each(_loc3_ in this._4905.dataProvider)
               {
                  if(_loc3_.data == _716.CREATE_BONE)
                  {
                     this._6694 = _loc3_;
                  }
               }
            }
         }
         else if(param2 == this.stageView)
         {
            if(this._2871)
            {
               this.stageView._2871 = this._2871;
            }
         }
         else if(param2 == this._4904)
         {
            if(this._2871)
            {
               this._4904._3286 = this._2871._3286;
               this._4904._4840.selected = this._6698._2969;
               this._4904._4839.selected = this._6698._2968;
            }
         }
         else if(param2 == this._4883)
         {
            if(this._2871)
            {
               this._4883._4866(Math.round(this._2871._3286.zoom * 100));
               this._4883.addEventListener(Event.CHANGE,this._6692);
            }
         }
         else if(param2 == this._6689)
         {
            this._6689.addEventListener(MouseEvent.CLICK,this._6696);
         }
      }
      
      private function _6696(param1:MouseEvent) : void
      {
         dispatchEvent(new DBPanelEvent(DBPanelEvent.IMPORT_ASSET));
      }
      
      protected function _6697() : void
      {
         if(_data is _671)
         {
            this._3329.removeEventListener(DBModelEvent.DATA_CHANGED,this._6693);
         }
      }
      
      override protected function _6699() : void
      {
         if(_data is _671)
         {
            this.init();
         }
      }
      
      private function _6691(param1:IndexChangeEvent) : void
      {
         dispatchEvent(new DBPanelEvent(DBPanelEvent.EDIT_MODE_CHANGED,param1));
      }
      
      private function _6408(param1:IndexChangeEvent) : void
      {
         switch(this._4905._2484.data)
         {
            case _716.CREATE_BONE:
               _11110.instance._11380._11130(_11108.StageToolBar);
         }
         dispatchEvent(new DBPanelEvent(DBPanelEvent.TOOL_CHANGED,this._4905._2484.data));
      }
      
      public function _4892() : void
      {
         this._4905.selectedIndex = 0;
         dispatchEvent(new DBPanelEvent(DBPanelEvent.TOOL_CHANGED,this._4905._2484.data));
      }
      
      private function _6692(param1:Event) : void
      {
         dispatchEvent(new DBPanelEvent(DBPanelEvent.ZOOM_CHANGED,this._4883.value / 100));
      }
      
      private function _6693(param1:DBModelEvent = null) : void
      {
         if(this._2871)
         {
            if(this._4904)
            {
               this._4904._3286 = this._2871._3286;
               this._4904._4840.selected = this._6698._2969;
               this._4904._4839.selected = this._6698._2968;
            }
            if(this._4883)
            {
               this._4883._4866(Math.round(this._2871._3286.zoom * 100));
               this._4883.addEventListener(Event.CHANGE,this._6692);
            }
            if(this.stageView)
            {
               this.stageView._2871 = this._2871;
            }
            this._2871._1655._10652();
         }
      }
      
      private function init() : void
      {
         this._3329.addEventListener(DBModelEvent.DATA_CHANGED,this._6693);
         this._6693(null);
         if(this._4895)
         {
            this._4895.selectedIndex = 0;
         }
      }
      
      private function _3095() : void
      {
         if(this._2873 == _715.ARMATURE)
         {
            if(this._6694)
            {
               this._6694.enabled = true;
            }
            if(this._4895)
            {
               this._4895.selectedIndex = 0;
            }
         }
         else if(this._2873 == _715.ANIMATE)
         {
            if(this._6694)
            {
               this._6694.enabled = false;
            }
            if(this._4895)
            {
               this._4895.selectedIndex = 1;
            }
         }
         if(this._4905)
         {
            (this._4905.dataProvider as _1037).refresh();
         }
      }
      
      private function get _6698() : _671
      {
         return data as _671;
      }
      
      override public function set data(param1:Object) : void
      {
         if(_data == param1)
         {
            return;
         }
         this._6697();
         super.data = param1;
      }
      
      public function get _2871() : _665
      {
         return (data as _671).data as _665;
      }
      
      private function get _3329() : _671
      {
         return data as _671;
      }
      
      public function get _4893() : _716
      {
         return this._4905._2484.data;
      }
      
      public function set _4893(param1:_716) : void
      {
         var _loc2_:Object = null;
         for each(_loc2_ in this._4905.dataProvider)
         {
            if(_loc2_.data == param1)
            {
               this._4905._2484 = _loc2_;
            }
         }
      }
      
      public function get _2873() : _715
      {
         return this._3329._2873;
      }
      
      public function set _2873(param1:_715) : void
      {
         if(this._2873 == param1)
         {
            return;
         }
         this._3329._2873 = param1;
         this._3095();
      }
   }
}

