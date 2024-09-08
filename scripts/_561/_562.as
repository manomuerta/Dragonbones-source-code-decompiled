package _561
{
   import _13._12;
   import _13._14;
   import _51._79;
   import _652._654;
   import _658._659;
   import _658._661;
   import _783.CommandNotification;
   import _877._886;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class _562 extends _567
   {
      private var _4225:_886;
      
      private var _4235:Point;
      
      private var _4243:Vector.<_661>;
      
      private var _4227:_661;
      
      private var _4234:_661;
      
      private var _4224:Vector.<_661>;
      
      private var _end:Boolean;
      
      private var _4223:_661;
      
      public function _562()
      {
         this.HELP_VERTEX = new _661(0,0,uint.MAX_VALUE - 1);
         super();
         this._4235 = new Point();
         this._4243 = new Vector.<_661>(2);
         this._4224 = new Vector.<_661>();
      }
      
      public function set _4229(param1:_886) : void
      {
         this._4225 = param1;
         this._4225.visible = _2123 != null;
      }
      
      override protected function dispose() : void
      {
         if(!this._end)
         {
            this._end = true;
            if(_2123.vertices.length < 3)
            {
               _2217._1650();
            }
            else
            {
               _1567(new CommandNotification(CommandNotification.END_ADD_OUTLINE,{
                  "_1837":_4213,
                  "mesh":_2123,
                  "_3174":this._4234
               }));
               _2217._1652();
            }
            this._4234 = null;
         }
         if(this._4225)
         {
            this._4225.visible = false;
         }
         if(_4210)
         {
            _4210._4208(null,null);
            _4210._4226(null,null);
         }
         super.dispose();
      }
      
      override public function _4242(param1:_659, param2:_79) : void
      {
         super._4242(param1,param2);
         if(this._4225)
         {
            this._4225.visible = _2123 != null;
         }
      }
      
      override protected function init() : void
      {
         this._end = false;
         this._4223 = null;
         _2217._3792();
         _1567(new CommandNotification(CommandNotification.START_ADD_OUTLINE,{
            "_1837":_4213,
            "mesh":_2123
         }));
      }
      
      override protected function _4205() : void
      {
         _1564(CommandNotification.SHOW_CLOSE_PROJECT_CONFIRMATION_DIALOG,this._4236);
         if(_4211)
         {
            _4211.removeEventListener(MouseEvent.ROLL_OVER,this._4233);
            _4211.removeEventListener(MouseEvent.ROLL_OUT,this._4237);
            if(_4211.stage)
            {
               _4211.stage.removeEventListener(MouseEvent.MOUSE_DOWN,this._4063);
               _4211.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
            }
         }
      }
      
      override protected function _1576() : void
      {
         _1565(CommandNotification.SHOW_CLOSE_PROJECT_CONFIRMATION_DIALOG,this._4236,100);
         _4211.stage.addEventListener(MouseEvent.MOUSE_DOWN,this._4063);
         _4211.addEventListener(MouseEvent.ROLL_OVER,this._4233);
         _4211.addEventListener(MouseEvent.ROLL_OUT,this._4237);
         _4211.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
      }
      
      private function _4236(param1:CommandNotification) : void
      {
         _4216._3187();
      }
      
      override public function set _4240(param1:Boolean) : void
      {
         super._4240 = param1;
         if(_4239)
         {
            this._4225.visible = false;
            if(_4210)
            {
               _4210._4231(null,null);
               _4210._4208(null,null);
               _4210._4226(null,null);
            }
         }
         else
         {
            this._4228(_4211.stage.mouseX,_4211.stage.mouseY);
         }
      }
      
      override public function set _4230(param1:Boolean) : void
      {
         super._4230 = param1;
         if(param1)
         {
            this._4225.visible = false;
         }
         else
         {
            this._4228(_4211.stage.mouseX,_4211.stage.mouseY);
         }
      }
      
      private function _4237(param1:MouseEvent) : void
      {
         this._4225.visible = false;
      }
      
      private function _4233(param1:MouseEvent) : void
      {
         if(_4220)
         {
            return;
         }
         this._4225.visible = true;
      }
      
      private function _4063(param1:MouseEvent) : void
      {
         if(_4220 || _4239)
         {
            if(_4239)
            {
               _4216._3187();
            }
            return;
         }
         if(this._4225.visible)
         {
            this._4235.x = this._4225.x;
            this._4235.y = this._4225.y;
            this._4235 = this._4225.parent.localToGlobal(this._4235);
            this._4235 = _4211.globalToLocal(this._4235);
            this._4221(this._4235.x,this._4235.y);
         }
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         if(_4220 || _4239)
         {
            return;
         }
         this._4228(param1.stageX,param1.stageY);
      }
      
      private function _4228(param1:Number, param2:Number) : void
      {
         var _loc5_:Vector.<_661> = null;
         var _loc6_:_661 = null;
         this._4235.x = param1;
         this._4235.y = param2;
         this._4235 = _4211.globalToLocal(this._4235);
         if(this._4235.x < -_4210.width / 2)
         {
            this._4235.x = -_4210.width / 2;
         }
         else if(this._4235.x > _4210.width / 2)
         {
            this._4235.x = _4210.width / 2;
         }
         if(this._4235.y < -_4210.height / 2)
         {
            this._4235.y = -_4210.height / 2;
         }
         else if(this._4235.y > _4210.height / 2)
         {
            this._4235.y = _4210.height / 2;
         }
         var _loc3_:Number = this._4235.x;
         var _loc4_:Number = this._4235.y;
         this._4235 = _4211.localToGlobal(this._4235);
         this._4235 = this._4225.parent.globalToLocal(this._4235);
         this._4225.x = this._4235.x;
         this._4225.y = this._4235.y;
         this._4235.x = _loc3_;
         this._4235.y = _loc4_;
         _loc5_ = _4217(_loc3_,_loc4_);
         if((Boolean(_loc5_)) && _loc5_.length == 1)
         {
            _loc6_ = _loc5_[0];
         }
         if(_loc6_ == null)
         {
            if(_loc5_ != null && _loc5_.length == 2)
            {
               this._4225.visible = true;
            }
            else
            {
               this._4225.visible = !this._4218();
            }
         }
         else if(_loc6_ == _2123.vertices[0] && _2123.outline.length >= 4)
         {
            this._4225.visible = true;
         }
         else
         {
            this._4225.visible = false;
         }
         this._4227 = null;
         this._4243[0] = null;
         this._4243[1] = null;
         if(this._4225.visible)
         {
            if(_loc6_)
            {
               this._4232(_loc6_);
            }
            else if(Boolean(_loc5_) && _loc5_.length == 2)
            {
               this._4241(_loc3_,_loc4_,_loc5_);
            }
            else
            {
               _4210._4209 = null;
               _4210._4231(null,null);
               this.HELP_VERTEX.x = _loc3_;
               this.HELP_VERTEX.y = _loc4_;
            }
            if(this._4223)
            {
               _4210._4226(this._4223,this.HELP_VERTEX);
            }
            if(Boolean(this._4234) && this._4243[0] == null)
            {
               _4210._4208(this._4234,this.HELP_VERTEX);
            }
            else
            {
               _4210._4208(null,null);
               _4210._4226(this._4223,this._4234);
            }
            _4210._2466();
         }
         else
         {
            this.HELP_VERTEX.x = this._4235.x;
            this.HELP_VERTEX.y = this._4235.y;
            _4210._4209 = null;
            _4210._4231(null,null);
            _4210._4208(null,null);
            _4210._4226(null,null);
         }
         this._4222();
      }
      
      private function _4222() : void
      {
         if(this._4227 && _2123.outline.length >= 4 && this._4227 == _2123.vertices[0])
         {
            _14.setCursor(_12.CURSOR_MESH_OUTLINE_END);
         }
         else
         {
            _14.setCursor(_12.CURSOR_MESH_OUTLINE);
         }
      }
      
      private function _4218() : Boolean
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this._4234 != null)
         {
            _loc1_ = 0;
            _loc2_ = int(_2123.outline.length);
            while(_loc1_ < _loc2_)
            {
               if(_654.cross2(this._4234,this.HELP_VERTEX,_2123.outline[_loc1_],_2123.outline[_loc1_ + 1]))
               {
                  return true;
               }
               _loc1_ += 2;
            }
         }
         return false;
      }
      
      private function _4232(param1:_661) : void
      {
         this._4227 = param1;
         _4210._4209 = param1;
         _4210._4231(null,null);
         this._4235.x = param1.x;
         this._4235.y = param1.y;
         this._4235 = _4211.localToGlobal(this._4235);
         this._4235 = this._4225.parent.globalToLocal(this._4235);
         this._4225.x = this._4235.x;
         this._4225.y = this._4235.y;
         this.HELP_VERTEX.x = param1.x;
         this.HELP_VERTEX.y = param1.y;
      }
      
      private function _4241(param1:Number, param2:Number, param3:Vector.<_661>) : void
      {
         _4210._4209 = null;
         _4210._4231(param3[0],param3[1]);
         var _loc4_:Array = _654._4219(param1,param2,param3[0].x,param3[0].y,param3[1].x,param3[1].y);
         if(_loc4_)
         {
            this._4243[0] = param3[0];
            this._4243[1] = param3[1];
            this._4235.x = _loc4_[0];
            this._4235.y = _loc4_[1];
            this._4235 = _4211.localToGlobal(this._4235);
            this._4235 = this._4225.parent.globalToLocal(this._4235);
            this._4225.x = this._4235.x;
            this._4225.y = this._4235.y;
            this.HELP_VERTEX.x = _loc4_[0];
            this.HELP_VERTEX.y = _loc4_[1];
         }
      }
      
      private function _4221(param1:Number, param2:Number) : void
      {
         var _loc3_:_661 = null;
         var _loc4_:_661 = null;
         var _loc5_:Vector.<_661> = null;
         if(this._4227 && _2123.outline.length >= 4 && this._4227 == _2123.vertices[0])
         {
            this._end = true;
            _1567(new CommandNotification(CommandNotification.END_ADD_OUTLINE,{
               "_1837":_4213,
               "mesh":_2123,
               "_3174":this._4234
            }));
            this._4234 = null;
            _2217._1652();
         }
         else if(!this._4227)
         {
            _loc3_ = _2123._1750(param1,param2);
            _loc4_ = _loc3_.clone() as _661;
            _loc5_ = this._4243.concat();
            _1567(new CommandNotification(CommandNotification.ADD_OUTLINE_VERTEX,{
               "_1837":_4213,
               "mesh":_2123,
               "vertex":_loc3_,
               "_3169":_loc4_,
               "edge":_loc5_,
               "_3174":this._4234
            }));
            if(_loc5_ == null || _loc5_[0] == null)
            {
               this._4234 = _loc3_;
            }
            if(this._4223 == null)
            {
               this._4223 = _loc3_;
            }
         }
      }
      
      public function execute(param1:_661, param2:_661) : void
      {
         if(param2)
         {
            this._4234 = param2;
         }
         this._4224.push(param1);
         this._4228(_4211.stage.mouseX,_4211.stage.mouseY);
      }
      
      public function revert() : void
      {
         this._4234 = this._4224.pop();
         this._4228(_4211.stage.mouseX,_4211.stage.mouseY);
      }
   }
}

