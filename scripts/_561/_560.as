package _561
{
   import _652._654;
   import _658._661;
   import _783.CommandNotification;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class _560 extends _567
   {
      private var _4075:Boolean;
      
      private var _4214:_661;
      
      private var _4215:_661;
      
      private var _4212:_661;
      
      public function _560()
      {
         this.HELP_VERTEX = new _661(0,0,uint.MAX_VALUE);
         super();
      }
      
      override protected function _1576() : void
      {
         _4211.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         _4211.stage.addEventListener(MouseEvent.MOUSE_UP,this._4083);
         _4211.addEventListener(MouseEvent.MOUSE_DOWN,this._4063);
      }
      
      override protected function _4205() : void
      {
         _4211.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         _4211.stage.removeEventListener(MouseEvent.MOUSE_UP,this._4083);
         _4211.removeEventListener(MouseEvent.MOUSE_DOWN,this._4063);
      }
      
      private function _4063(param1:MouseEvent) : void
      {
         var _loc2_:Number = param1.localX;
         var _loc3_:Number = param1.localY;
         this._4075 = true;
         if(_4210._4209 != null)
         {
            this._4214 = _4210._4209;
         }
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         var _loc4_:_661 = null;
         if(!_4211.contains(param1.target as DisplayObject))
         {
            this._4215 = null;
            return;
         }
         var _loc2_:Number = param1.localX;
         var _loc3_:Number = param1.localY;
         if(!this._4075)
         {
            _loc4_ = _4206(_loc2_,_loc3_);
            _4210._4209 = _loc4_;
         }
         else if(this._4214 != null)
         {
            if(this._4212 == null)
            {
               this._4212 = this.HELP_VERTEX;
               _4210._4208(this._4214,this._4212);
               this._4212.x = _loc2_;
               this._4212.y = _loc3_;
            }
            else
            {
               this._4215 = _4206(_loc2_,_loc3_);
               if(this._4215)
               {
                  this._4212.x = this._4215.x;
                  this._4212.y = this._4215.y;
               }
               else
               {
                  this._4212.x = _loc2_;
                  this._4212.y = _loc3_;
               }
               if(this._3188())
               {
                  this._4215 = null;
                  return;
               }
            }
            _4210._2466();
         }
      }
      
      private function _4083(param1:MouseEvent) : void
      {
         this._4075 = false;
         _4210._4209 = null;
         if(this._4212)
         {
            _4210._4208(null,null);
         }
         if(Boolean(this._4214) && Boolean(this._4215) && this._4214 != this._4215)
         {
            if(!this._4207())
            {
               _1567(new CommandNotification(CommandNotification.ADD_EDGE,{
                  "_1837":_4213,
                  "mesh":_2123,
                  "v0":this._4214,
                  "v1":this._4215
               }));
            }
         }
         this._4214 = null;
         this._4215 = null;
         this._4212 = null;
      }
      
      private function _3188() : Boolean
      {
         var _loc1_:_661 = null;
         var _loc2_:_661 = null;
         var _loc3_:int = 0;
         var _loc4_:int = int(_2123.userEdges.length);
         while(_loc3_ < _loc4_)
         {
            _loc1_ = _2123.userEdges[_loc3_];
            _loc2_ = _2123.userEdges[_loc3_ + 1];
            if(this._4214.equals(_loc1_) && this._4212.equals(_loc2_) || this._4214.equals(_loc2_) && this._4212.equals(_loc1_))
            {
               return true;
            }
            if(_654.cross2(_loc1_,_loc2_,this._4214,this._4212))
            {
               return true;
            }
            _loc3_ += 2;
         }
         return false;
      }
      
      private function _4207() : Boolean
      {
         var _loc1_:_661 = null;
         var _loc2_:_661 = null;
         var _loc3_:int = 0;
         var _loc4_:int = int(_2123.outline.length);
         while(_loc3_ < _loc4_)
         {
            _loc1_ = _2123.outline[_loc3_];
            _loc2_ = _2123.outline[_loc3_ + 1];
            if(this._4214.id == _loc1_.id && this._4215.id == _loc2_.id || this._4214.id == _loc2_.id && this._4215.id == _loc1_.id)
            {
               return true;
            }
            _loc3_ += 2;
         }
         return false;
      }
   }
}

