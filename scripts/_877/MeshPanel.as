package _877
{
   import _1045.Group;
   import _1177.UIEvent;
   import _127._156;
   import _636.MeshEvent;
   import _658._659;
   import egret.utils.tr;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class MeshPanel extends _156
   {
      private var _4322:_878;
      
      private var _4211:_876;
      
      private var _4344:_887;
      
      private var _6455:_886;
      
      private var _4761:_659;
      
      private var _active:Boolean;
      
      private var _1857:Number = 1;
      
      private var _6454:Point;
      
      private var _6464:Boolean;
      
      private var _6463:Boolean;
      
      private var _6460:Number = 0;
      
      private var _6457:Number = 0;
      
      private var group:Group;
      
      private var _10537:Point;
      
      public function MeshPanel()
      {
         this._4344 = new _887();
         this._6455 = new _886();
         super();
         this.title = tr("Mesh.panel.editor");
         this._6454 = new Point();
         this._10537 = new Point();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._4211 = new _876();
         this._4322 = new _878();
         this.percentHeight = 100;
         this.percentWidth = 100;
         this.group = new Group();
         this.group.left = 0;
         this.group.top = 2;
         this.group.right = 0;
         this.group.percentWidth = 100;
         this.group.percentHeight = 100;
         addElement(this.group);
         this.group.addElement(this._4211);
         this.group.addElement(this._4344);
         this.group.addElement(this._6455);
         this._6455.visible = false;
         this.group.addElement(this._4322);
         this._4322.visible = false;
         this._4322.bottom = 0;
         addEventListener(UIEvent.CREATION_COMPLETE,this.onComplete);
         this.addEventListener(Event.ADDED_TO_STAGE,this._4333);
         this.addEventListener(Event.REMOVED_FROM_STAGE,this._4330);
         this.addEventListener(MouseEvent.ROLL_OVER,this._4233);
         this.addEventListener(MouseEvent.ROLL_OUT,this._4237);
      }
      
      private function _4330(param1:Event) : void
      {
         if(this.stage)
         {
            this.moving = false;
            this.stage.removeEventListener(MouseEvent.MOUSE_DOWN,this._6456);
         }
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
         if(param2 < 10 || param1 < 10)
         {
            return;
         }
         if(this._6457 > 0 && this._6460 > 0)
         {
            this._4211.x += (param1 - this._6460) / 2;
            this._4211.y += (param2 - this._6457) / 2;
         }
         this._4322.width = param1;
         this.group.height = param2;
         this._6460 = param1;
         this._6457 = param2;
         this._3139();
      }
      
      private function _3139() : void
      {
         this._4344._2026 = this._4211.transform.matrix;
      }
      
      private function _4237(param1:MouseEvent) : void
      {
         this.active = false;
      }
      
      private function _4233(param1:MouseEvent) : void
      {
         this.active = true;
      }
      
      private function _4333(param1:Event) : void
      {
         if(this._4761)
         {
            this._4211.x = this.width / 2;
            this._4211.y = this.height / 2;
            this._3139();
         }
      }
      
      private function onComplete(param1:UIEvent) : void
      {
         removeEventListener(UIEvent.CREATION_COMPLETE,this.onComplete);
         if(this._4761)
         {
            this._4211.model = this._4761;
         }
      }
      
      public function set _4238(param1:_659) : void
      {
         if(this._4761 != param1)
         {
            this._4761 = param1;
            if(this._4211)
            {
               this._4211.model = this._4761;
               this._4211.x = this.width / 2;
               this._4211.y = this.height / 2;
               this._3139();
            }
            this._6457 = 0;
            this._6460 = 0;
         }
      }
      
      public function get _4325() : _878
      {
         return this._4322;
      }
      
      public function get _4269() : _876
      {
         return this._4211;
      }
      
      public function set active(param1:Boolean) : void
      {
         if(this._active != param1)
         {
            this._active = param1;
            if(this._active)
            {
               this.doubleClickEnabled = true;
               if(this.stage)
               {
                  this.stage.addEventListener(MouseEvent.MOUSE_WHEEL,this._6453);
                  this.stage.addEventListener(MouseEvent.RIGHT_MOUSE_DOWN,this._6461);
                  this.stage.addEventListener(MouseEvent.RIGHT_MOUSE_UP,this._6458);
               }
               this.addEventListener(MouseEvent.DOUBLE_CLICK,this._6459);
            }
            else
            {
               if(this.stage)
               {
                  this.stage.removeEventListener(MouseEvent.MOUSE_WHEEL,this._6453);
                  this.stage.removeEventListener(MouseEvent.RIGHT_MOUSE_DOWN,this._6461);
                  this.stage.removeEventListener(MouseEvent.RIGHT_MOUSE_UP,this._6458);
               }
               this.removeEventListener(MouseEvent.DOUBLE_CLICK,this._6459);
            }
         }
      }
      
      public function get _4313() : _887
      {
         return this._4344;
      }
      
      public function get _4324() : _886
      {
         return this._6455;
      }
      
      public function get moving() : Boolean
      {
         return this._6464;
      }
      
      public function set moving(param1:Boolean) : void
      {
         if(this._6464 != param1)
         {
            this._6464 = param1;
            dispatchEvent(new MeshEvent(MeshEvent.PANEL_MOVING,this._6464));
         }
      }
      
      private function _6458(param1:MouseEvent) : void
      {
         this._6462(null);
         if(!this._6463)
         {
            this.moving = false;
         }
      }
      
      private function _6461(param1:MouseEvent) : void
      {
         if(!this._4761)
         {
            return;
         }
         if(!this._6464)
         {
            this._6456(param1);
            this.moving = true;
         }
      }
      
      private function _6459(param1:MouseEvent) : void
      {
         if(!this._4761)
         {
            return;
         }
         var _loc2_:Number = (this.width - 40) / this._4761.width;
         var _loc3_:Number = (this.height - 100) / this._4761.height;
         var _loc4_:Number = _loc2_ < _loc3_ ? _loc2_ : _loc3_;
         if(_loc4_ > 1)
         {
            _loc4_ = 1;
         }
         this._6106(_loc4_);
         this._4211.x = this.width / 2;
         this._4211.y = this.height / 2;
         this._3139();
      }
      
      private function _6456(param1:MouseEvent) : void
      {
         this._6454.x = param1.stageX;
         this._6454.y = param1.stageY;
         this.stage.addEventListener(MouseEvent.MOUSE_MOVE,this._6465);
         this._6463 = true;
         this.moving = true;
      }
      
      private function _6462(param1:MouseEvent) : void
      {
         if(this.stage)
         {
            this.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this._6465);
         }
         this._6463 = false;
         this.moving = false;
      }
      
      private function _6465(param1:MouseEvent) : void
      {
         var _loc2_:Number = param1.stageX;
         var _loc3_:Number = param1.stageY;
         this._4211.x += _loc2_ - this._6454.x;
         this._4211.y += _loc3_ - this._6454.y;
         this._6454.x = _loc2_;
         this._6454.y = _loc3_;
         this._3139();
      }
      
      private function _6106(param1:Number, param2:Point = null) : void
      {
         this._1857 = param1;
         this._4211._6106(this._1857,param2);
         dispatchEvent(new MeshEvent(MeshEvent.SCALE,this._1857));
         this._3139();
      }
      
      private function _6453(param1:MouseEvent) : void
      {
         if(!this._4761)
         {
            return;
         }
         var _loc2_:Number = param1.delta / 50;
         var _loc3_:Number = this._1857 * (1 + _loc2_);
         _loc3_ = _loc3_ < 20 ? _loc3_ : 20;
         _loc3_ = _loc3_ > 0.2 ? _loc3_ : 0.2;
         if(this._1857 != _loc3_)
         {
            this._10537.x = param1.stageX;
            this._10537.y = param1.stageY;
            this._6106(_loc3_,this._10537);
         }
      }
   }
}

