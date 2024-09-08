package _1045
{
   import _1038._1039;
   import _1088._1094;
   import _1177.IndexChangeEvent;
   import _1177.ListEvent;
   import _1177.RendererExistenceEvent;
   import egret.core._1133;
   import egret.core.ns_egret;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   use namespace ns_egret;
   
   public class TabBar extends _1094
   {
      private var _8433:Boolean;
      
      private var _8094:_1070;
      
      public function TabBar()
      {
         super();
         tabChildren = false;
         tabEnabled = true;
         this._6678 = true;
      }
      
      override public function set _6678(param1:Boolean) : void
      {
         if(param1 == _6678)
         {
            return;
         }
         super._6678 = param1;
         this._8433 = true;
         _2466();
      }
      
      override public function set dataProvider(param1:_1039) : void
      {
         if(dataProvider is _1107)
         {
            dataProvider.removeEventListener("IndexChanged",this._8551);
            removeEventListener(IndexChangeEvent.CHANGE,this._8553);
         }
         if(param1 is _1107)
         {
            param1.addEventListener("IndexChanged",this._8551);
            addEventListener(IndexChangeEvent.CHANGE,this._8553);
         }
         super.dataProvider = param1;
      }
      
      private function _8553(param1:IndexChangeEvent) : void
      {
         _1107(dataProvider).ns_egret::_2475(param1.newIndex,false);
      }
      
      private function _8551(param1:Event) : void
      {
         ns_egret::_2475(_1107(dataProvider).selectedIndex,false);
      }
      
      override protected function _2476() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:TabBarButton = null;
         super._2476();
         if(this._8433 && Boolean(_2490))
         {
            this._8433 = false;
            _loc1_ = _2490._2249;
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               _loc3_ = _2490.getElementAt(_loc2_) as TabBarButton;
               if(_loc3_)
               {
                  _loc3_._8552 = !_6678;
               }
               _loc2_++;
            }
         }
      }
      
      override protected function _2603(param1:RendererExistenceEvent) : void
      {
         super._2603(param1);
         var _loc2_:_1070 = param1._2487;
         if(_loc2_)
         {
            _loc2_.addEventListener(MouseEvent.MOUSE_DOWN,this._8095);
            _loc2_.addEventListener(MouseEvent.MOUSE_UP,this._8099);
            if(_loc2_ is TabBarButton)
            {
               TabBarButton(_loc2_)._8552 = !_6678;
            }
         }
      }
      
      override protected function _2601(param1:RendererExistenceEvent) : void
      {
         super._2601(param1);
         var _loc2_:_1070 = param1._2487;
         if(_loc2_)
         {
            _loc2_.removeEventListener(MouseEvent.MOUSE_DOWN,this._8095);
            _loc2_.removeEventListener(MouseEvent.MOUSE_UP,this._8099);
         }
      }
      
      private function _8095(param1:MouseEvent) : void
      {
         var _loc2_:_1070 = param1.currentTarget as _1070;
         this._8094 = _loc2_;
         stage.addEventListener(MouseEvent.MOUSE_UP,this._8097,false,0,true);
         stage.addEventListener(Event.MOUSE_LEAVE,this._8097,false,0,true);
      }
      
      private function _8099(param1:MouseEvent) : void
      {
         var _loc3_:int = 0;
         var _loc2_:_1070 = param1.currentTarget as _1070;
         if(_loc2_ != this._8094)
         {
            return;
         }
         if(_loc2_)
         {
            _loc3_ = _loc2_.itemIndex;
         }
         else
         {
            _loc3_ = _2490.getElementIndex(param1.currentTarget as _1133);
         }
         if(_loc3_ == selectedIndex)
         {
            if(!_6678)
            {
               ns_egret::_2475(NO_SELECTION,true);
            }
         }
         else
         {
            ns_egret::_2475(_loc3_,true);
         }
         ns_egret::_2473(param1,ListEvent.ITEM_CLICK,_loc2_);
      }
      
      private function _8097(param1:Event) : void
      {
         if(stage != null)
         {
            stage.removeEventListener(MouseEvent.MOUSE_UP,this._8097);
            stage.removeEventListener(Event.MOUSE_LEAVE,this._8097);
         }
         this._8094 = null;
      }
   }
}

