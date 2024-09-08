package _11243
{
   import _13._12;
   import _13._14;
   import _1404._1407;
   import _579._580;
   import _586._11247;
   import _586._603;
   import _652._654;
   import _658._661;
   import _783.BoundingBoxNotification;
   import _783.CommandNotification;
   import _783.StageNotification;
   import _81._88;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.geom.Point;
   
   public class _11246 extends _11245
   {
      private var _11384:_661;
      
      private var _11399:_661;
      
      private var _11401:Vector.<_661>;
      
      private var _11402:Vector.<_661>;
      
      private var _11391:Boolean;
      
      private var _11403:String;
      
      public function _11246()
      {
         this._11384 = new _661(0,0,0);
         this._11399 = new _661(0,0,0);
         super();
         this._11401 = new Vector.<_661>();
      }
      
      override public function start() : void
      {
         super.start();
         _5157._3024();
         _11381._4231(null,null);
         _11381._4209 = null;
         _11381._11405 = true;
         _11381._11400 = this._11399;
         this._11402 = _11383.vertices.concat();
         _11383.vertices.length = 0;
         this._11391 = false;
         _1567(new StageNotification(StageNotification.START_EDIT_BOUNDINGBOX));
         _14.setCursor(_12.CURSOR_BOUNDINGBOX_ADD,_11247.MOUSE_CURSOR_WEIGHT);
         if(stage)
         {
            _4235.x = stage.mouseX;
            _4235.y = stage.mouseY;
            _11381._11400.x = stage.mouseX;
            _11381._11400.y = stage.mouseY;
         }
         if(_11381._1837)
         {
            this._2212._2907(_11381._1837);
         }
         if(!_2217._3297)
         {
            _2217._3792();
         }
         var _loc1_:Vector.<_661> = new Vector.<_661>();
         var _loc2_:String = CommandNotification.NEW_BOUNDINGBOX_ADD_VERTEX;
         _1567(new CommandNotification(_loc2_,{
            "_1837":_11381._1837,
            "_11278":_11383,
            "_11299":_11381.vo,
            "_11303":_loc1_,
            "_11302":this._11402,
            "boundingBoxModel":_11381,
            "first":true
         }));
      }
      
      override public function stop() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:String = null;
         var _loc4_:Point = null;
         var _loc5_:Point = null;
         _11381._11405 = false;
         _11381._11400 = null;
         _11381._4231(null,null);
         _11381._4209 = null;
         _11381._2466();
         _5157._3024();
         this._11391 = false;
         _14._1602(_12.CURSOR_BOUNDINGBOX_ADD);
         _14._1602(_12.CURSOR_BOUNDINGBOX_OUTLINE_END);
         _14._1602(_12.CURSOR_MOVE);
         if(_11383.vertices.length < 3)
         {
            _2217._1650();
            _loc2_ = int(this._11402.length);
            if(_11383)
            {
               _11383.vertices.length = 0;
               _loc1_ = 0;
               while(_loc1_ < _loc2_)
               {
                  _11383.vertices.push(this._11402[_loc1_]);
                  _loc1_++;
               }
               _11381._2466();
               if(_11381._1837)
               {
                  this._2212._2907(_11381._1837);
               }
            }
         }
         else
         {
            _loc3_ = CommandNotification.NORMALIZE_BOUNDINGBOX;
            _loc4_ = _654._11392(Vector.<Point>(_11383.vertices));
            _2205 = new Matrix();
            _88._2013(_11381.vo.localTransform,_2205);
            _2205.tx = 0;
            _2205.ty = 0;
            _loc5_ = _2205.transformPoint(_loc4_);
            _1567(new CommandNotification(_loc3_,{
               "_1837":_11381._1837,
               "_11278":_11383,
               "_11299":_11381.vo,
               "boundingBoxModel":_11381,
               "_11305":_loc4_,
               "_11304":_loc5_
            }));
            _2217._1652();
         }
         super.stop();
      }
      
      public function redo() : void
      {
         var _loc1_:String = CommandNotification.NEW_BOUNDINGBOX_ADD_VERTEX;
         var _loc2_:Vector.<_661> = new Vector.<_661>();
         _1567(new CommandNotification(_loc1_,{
            "_1837":_11381._1837,
            "_11299":_11381.vo,
            "_11278":_11383,
            "_11303":_loc2_,
            "_11302":_11383.vertices.concat(),
            "boundingBoxModel":_11381
         }));
         _11381._11385 = null;
         if(_11381._3823)
         {
            _11381._3823.length = 0;
         }
         _11381._5713[0] = null;
         _11381._5713[1] = null;
      }
      
      override protected function _4004(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
      }
      
      override protected function _4083(param1:MouseEvent) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:_661 = null;
         var _loc4_:String = null;
         var _loc5_:Point = null;
         var _loc6_:Vector.<_661> = null;
         var _loc7_:_661 = null;
         var _loc8_:_661 = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:Boolean = false;
         var _loc12_:_661 = null;
         var _loc13_:_661 = null;
         var _loc14_:Point = null;
         var _loc15_:Point = null;
         if(this._11391)
         {
            this._11391 = false;
            if(_11381._5713 && _11381._5713[0] && Boolean(_11381._5713[1]))
            {
               if(_11381._11385)
               {
                  _loc6_ = new Vector.<_661>();
                  _loc7_ = _11381._5713[0];
                  _loc8_ = _11381._5713[1];
                  _loc9_ = 0;
                  _loc10_ = int(_11383.vertices.length);
                  _loc9_ = 0;
                  while(_loc9_ < _loc10_)
                  {
                     _loc12_ = _11383.vertices[_loc9_];
                     if(_loc9_ < _loc10_ - 1)
                     {
                        _loc13_ = _11383.vertices[_loc9_ + 1];
                     }
                     else
                     {
                        _loc13_ = _11383.vertices[0];
                     }
                     _loc6_.push(_loc12_);
                     if((_loc12_ == _loc7_ && _loc13_ == _loc8_ || _loc12_ == _loc8_ && _loc13_ == _loc7_) && !_loc11_)
                     {
                        _loc3_ = new _661(_11381._11385.x,_11381._11385.y,0);
                        _loc6_.push(_loc3_);
                        _loc11_ = true;
                     }
                     _loc9_++;
                  }
                  _loc14_ = new Point();
                  _loc15_ = _loc14_.clone();
                  _loc4_ = CommandNotification.CREATE_BOUNDINGBOX;
                  _1567(new CommandNotification(_loc4_,{
                     "_1837":_11381._1837,
                     "_11299":_11381.vo,
                     "_11278":_11383,
                     "boundingBoxModel":_11381,
                     "_11303":_loc6_,
                     "_11302":_11383.vertices.concat(),
                     "_11305":_loc14_,
                     "_11304":_loc15_
                  }));
                  _11381._11385 = null;
                  _11381._5713[0] = null;
                  _11381._5713[1] = null;
                  _loc2_ = true;
               }
            }
            else if(_11381._4209 == null)
            {
               _loc3_ = new _661(_4235.x,_4235.y,0);
               _loc4_ = CommandNotification.NEW_BOUNDINGBOX_ADD_VERTEX;
               _loc6_ = _11383.vertices.concat();
               _loc6_.push(_loc3_);
               _1567(new CommandNotification(_loc4_,{
                  "_1837":_11381._1837,
                  "_11299":_11381.vo,
                  "_11278":_11383,
                  "_11303":_loc6_,
                  "_11302":_11383.vertices.concat(),
                  "boundingBoxModel":_11381
               }));
            }
            else if(_11381._4209 != null && _11381._4209 == _11383.vertices[0] && _11381.vertices.length >= 3)
            {
               _1567(new BoundingBoxNotification(BoundingBoxNotification.END_NEW));
            }
         }
         super._4083(param1);
         if(_loc2_)
         {
            this.onMouseMove(param1);
         }
      }
      
      override public function _5167(param1:_661) : void
      {
         super._5167(param1);
         _4344._1897 = null;
         _11381._3823 = null;
      }
      
      override protected function _4063(param1:MouseEvent) : void
      {
         if(_11381._4209 == null)
         {
            _4342 = false;
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
         this._11391 = true;
         this._11399.x = _4235.x;
         this._11399.y = _4235.y;
         super.onMouseMove(param1);
         if(_11381._5713 && _11381._5713[0] && Boolean(_11381._5713[1]))
         {
            this._4241(_4235.x,_4235.y,_11381._5713);
         }
         else
         {
            _11381._11385 = null;
         }
         if(_11381._11385)
         {
            _11381._11400 = null;
         }
         else
         {
            _11381._11400 = this._11399;
         }
         if(_11381.vertices.length > 0 && _11381._4209 == _11381.vertices[0])
         {
            _11381._11400 = null;
            if(_11381.vertices.length > 2)
            {
               _11381._11400 = _11381._4209;
            }
         }
         if(_11381.vertices.length >= 3 && _11381._4209 == _11381.vertices[0])
         {
            this._11404 = _12.CURSOR_BOUNDINGBOX_OUTLINE_END;
         }
         else if(_11381._4209 != null)
         {
            _11381._11385 = null;
            _11381._11400 = null;
            this._11404 = _12.CURSOR_MOVE;
         }
         else
         {
            this._11404 = _12.CURSOR_BOUNDINGBOX_ADD;
         }
         if(param1.target != _5097)
         {
            _11381._11400 = null;
            this._11391 = false;
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
      
      protected function get _2212() : _603
      {
         return (_1407.getInstance(_580) as _580)._2212;
      }
      
      public function set _11404(param1:String) : void
      {
         if(this._11403 != param1)
         {
            _14._1602(_12.CURSOR_BOUNDINGBOX_OUTLINE_END);
            _14._1602(_12.CURSOR_BOUNDINGBOX_ADD);
            _14._1602(_12.CURSOR_MOVE);
            this._11403 = param1;
            _14.setCursor(param1,_11247.MOUSE_CURSOR_WEIGHT);
         }
      }
   }
}

