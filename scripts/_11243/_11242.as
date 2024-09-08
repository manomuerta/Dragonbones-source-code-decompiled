package _11243
{
   import _13._12;
   import _13._14;
   import _586._11247;
   import _652._654;
   import _658._661;
   import _783.CommandNotification;
   import _783.StageNotification;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class _11242 extends _11245
   {
      private var _11384:_661;
      
      private var _11387:int;
      
      public function _11242()
      {
         this._11384 = new _661(0,0,0);
         super();
      }
      
      override public function start() : void
      {
         super.start();
         _12637 = true;
         _1567(new StageNotification(StageNotification.START_EDIT_BOUNDINGBOX));
         _14.setCursor(_12.AUTO,_11247.MOUSE_CURSOR_WEIGHT);
      }
      
      override protected function _4083(param1:MouseEvent) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:Vector.<_661> = null;
         var _loc4_:_661 = null;
         var _loc5_:_661 = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Boolean = false;
         var _loc9_:_661 = null;
         var _loc10_:_661 = null;
         var _loc11_:Point = null;
         var _loc12_:Point = null;
         var _loc13_:String = null;
         var _loc14_:_661 = null;
         if(_11381._5713 && _11381._5713[0] && Boolean(_11381._5713[1]))
         {
            if(_11381._11385)
            {
               _loc3_ = new Vector.<_661>();
               _loc4_ = _11381._5713[0];
               _loc5_ = _11381._5713[1];
               _loc6_ = 0;
               _loc7_ = int(_11383.vertices.length);
               _loc6_ = 0;
               while(_loc6_ < _loc7_)
               {
                  _loc9_ = _11383.vertices[_loc6_];
                  if(_loc6_ < _loc7_ - 1)
                  {
                     _loc10_ = _11383.vertices[_loc6_ + 1];
                  }
                  else
                  {
                     _loc10_ = _11383.vertices[0];
                  }
                  _loc3_.push(_loc9_);
                  if((_loc9_ == _loc4_ && _loc10_ == _loc5_ || _loc9_ == _loc5_ && _loc10_ == _loc4_) && !_loc8_)
                  {
                     _loc14_ = new _661(_11381._11385.x,_11381._11385.y,0);
                     _loc3_.push(_loc14_);
                     _loc8_ = true;
                  }
                  _loc6_++;
               }
               _loc11_ = new Point();
               _loc12_ = _loc11_.clone();
               _loc13_ = CommandNotification.CREATE_BOUNDINGBOX;
               _1567(new CommandNotification(_loc13_,{
                  "_1837":_11381._1837,
                  "_11299":_11381.vo,
                  "_11278":_11383,
                  "boundingBoxModel":_11381,
                  "_11303":_loc3_,
                  "_11302":_11383.vertices.concat(),
                  "_11305":_loc11_,
                  "_11304":_loc12_
               }));
               _11381._11385 = null;
               _11381._5713[0] = null;
               _11381._5713[1] = null;
               _loc2_ = true;
            }
         }
         super._4083(param1);
         if(_loc2_)
         {
            this.onMouseMove(param1);
         }
      }
      
      override public function stop() : void
      {
         super.stop();
         _14._1602(_12.CURSOR_BOUNDINGBOX_ADD);
         _14._1602(_12.AUTO);
         _14._1602(_12.CURSOR_MOVE);
      }
      
      override public function _5167(param1:_661) : void
      {
         super._5167(param1);
         _4344._1897 = null;
      }
      
      override protected function _4063(param1:MouseEvent) : void
      {
         if(_11381._4209 == null)
         {
            _4342 = false;
            if(this._11387 != 2)
            {
               _12638();
            }
         }
         else
         {
            super._4063(param1);
         }
         _4344._1897 = null;
         param1.stopImmediatePropagation();
      }
      
      override protected function onMouseMove(param1:MouseEvent) : void
      {
         super.onMouseMove(param1);
         if(_11381._5713 && _11381._5713[0] && Boolean(_11381._5713[1]))
         {
            this._4241(_4235.x,_4235.y,_11381._5713);
            this._11386 = 2;
         }
         else
         {
            _11381._11385 = null;
            if(_11381._4209)
            {
               this._11386 = 1;
            }
            else
            {
               this._11386 = 0;
            }
         }
      }
      
      override protected function _11382() : void
      {
      }
      
      override protected function _12639() : void
      {
      }
      
      private function _4241(param1:Number, param2:Number, param3:Vector.<_661>) : void
      {
         var _loc4_:Array = _654._4219(param1,param2,param3[0].x,param3[0].y,param3[1].x,param3[1].y);
         if(_loc4_)
         {
            this._11384.x = _loc4_[0];
            this._11384.y = _loc4_[1];
            _11381._11385 = this._11384;
         }
         else
         {
            _11381._11385 = null;
         }
      }
      
      public function set _11386(param1:int) : void
      {
         if(this._11387 != param1)
         {
            this._11387 = param1;
            _14._1602(_12.CURSOR_BOUNDINGBOX_ADD);
            _14._1602(_12.AUTO);
            _14._1602(_12.CURSOR_MOVE);
            switch(this._11387)
            {
               case 0:
                  _14.setCursor(_12.AUTO,_11247.MOUSE_CURSOR_WEIGHT);
                  break;
               case 1:
                  _14.setCursor(_12.CURSOR_MOVE,_11247.MOUSE_CURSOR_WEIGHT);
                  break;
               case 2:
                  _14.setCursor(_12.CURSOR_BOUNDINGBOX_ADD,_11247.MOUSE_CURSOR_WEIGHT);
            }
         }
      }
   }
}

