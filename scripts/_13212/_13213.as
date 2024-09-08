package _13212
{
   import _1038._1037;
   import _1045.List;
   import _1045.Scroller;
   import _1045._1046;
   import _1177.RendererExistenceEvent;
   import _1185._1189;
   import _51._70;
   import egret.core._1111;
   import egret.core.ns_egret;
   import egret.managers.DragManager;
   import flash.display.Shape;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   use namespace ns_egret;
   
   public class _13213 extends List
   {
      public var _2491:Scroller;
      
      private var _6457:Number;
      
      private var _stage:Stage;
      
      private var _13423:int;
      
      private var _13417:_13215;
      
      private var _13420:_13211;
      
      private var _13422:Shape;
      
      private var _13416:int;
      
      private var _13418:int;
      
      private var _13419:int;
      
      private var _13421:_1111;
      
      public function _13213()
      {
         super();
         var _loc1_:_1189 = new _1189();
         _loc1_.gap = _13215._2422;
         _loc1_._2419 = _13215._2422;
         this.layout = _loc1_;
         this.skinName = _13214;
         this.addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         this._13420 = new _13211();
         this._13422 = new Shape();
         this._13422.visible = true;
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         this._stage = this.stage;
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         var _loc3_:Number = NaN;
         super._5823(param1,param2);
         if(param2 < this._6457 && _13215._13415 < param2 - 16)
         {
            return;
         }
         if(param2 >= _13215.MIN_HEIGHT && param2 <= _13215.MAX_HEIGHT)
         {
            _13215._13415 = param2 - 16;
            if(this.dataProvider)
            {
               _loc3_ = this._2490.horizontalScrollPosition;
               (this.dataProvider as _1037).refresh();
               this._2449();
               this._2490.horizontalScrollPosition = _loc3_;
            }
         }
         this._6457 = param2;
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 is _1046)
         {
            (param2 as _1046).addEventListener(RendererExistenceEvent.RENDERER_ADD,this._4333);
            (param2 as _1046).addEventListener(RendererExistenceEvent.RENDERER_REMOVE,this._4330);
            (param2 as _1046).ns_egret::_1607(this._13422);
         }
      }
      
      private function _4330(param1:RendererExistenceEvent) : void
      {
         if(param1._2487 is _13215)
         {
            (param1._2487 as _13215).removeEventListener(MouseEvent.MOUSE_DOWN,this._4063);
         }
      }
      
      private function _4333(param1:RendererExistenceEvent) : void
      {
         if(param1._2487 is _13215)
         {
            (param1._2487 as _13215).addEventListener(MouseEvent.MOUSE_DOWN,this._4063);
         }
      }
      
      private function _4063(param1:MouseEvent) : void
      {
         this._13423 = 0;
         if(this._stage)
         {
            this._13417 = param1.currentTarget as _13215;
            if(this._13417)
            {
               this._13416 = this._13417.itemIndex;
               this._13419 = (this.dataProvider as _1037).length;
               this._stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
               this._stage.addEventListener(MouseEvent.MOUSE_UP,this._4083);
            }
         }
      }
      
      private function _4083(param1:MouseEvent) : void
      {
         this._13417 = null;
         this._13422.visible = false;
         this._13418 = -1;
         this._13416 = -1;
         if(this._stage)
         {
            this._stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
            this._stage.removeEventListener(MouseEvent.MOUSE_UP,this._4083);
         }
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         var _loc2_:Point = null;
         var _loc3_:int = 0;
         ++this._13423;
         this._13418 = -1;
         this._13422.visible = false;
         if(this._13423 == 1)
         {
            this._13421 = new _1111();
            this._13421.addData(this._13417.data,"targetDisplayVO");
            this._13421.addData(this._13416,"oldIndex");
            this._13420.width = this._13420.height = _13215._13415;
            this._13420._2104 = (this._13417.data as _70)._2104;
            DragManager.doDrag(this._13417,this._13421,this._13420,-this._13417.mouseX,-this._13417.mouseY);
         }
         else if(this._13423 > 1)
         {
            _loc2_ = new Point(_2490.mouseX,_2490.mouseY);
            if(_loc2_.y > 0 && _loc2_.y < _13215._13415)
            {
               this._13418 = (_loc2_.x - _13215._2422) / (_13215._13415 + _13215._2422);
               _loc3_ = (_loc2_.x - _13215._2422) % (_13215._13415 + _13215._2422);
               if(_loc3_ > _13215._13415 / 2 + _13215._2422)
               {
                  this._13418 += 1;
               }
               if(this._13418 > this._13419)
               {
                  this._13418 = this._13419;
               }
               this._13422.graphics.clear();
               this._13422.graphics.beginFill(3762325);
               this._13422.graphics.drawRect(0,0,2,_13215._13415 + 10);
               this._13422.graphics.endFill();
               this._13422.x = this._13418 * (_13215._13415 + _13215._2422) + 1;
               this._13422.visible = true;
            }
         }
         if(this._13418 != this._13416 && this._13418 >= 0)
         {
            if(this._13418 < this._13416)
            {
               this._13421.addData(this._13418,"newIndex");
               DragManager.acceptDragDrop(this);
            }
            else if(this._13418 - 1 > this._13416)
            {
               this._13421.addData(this._13418 - 1,"newIndex");
               DragManager.acceptDragDrop(this);
            }
            else
            {
               DragManager.acceptDragDrop(null);
            }
         }
         else
         {
            DragManager.acceptDragDrop(null);
         }
      }
   }
}

