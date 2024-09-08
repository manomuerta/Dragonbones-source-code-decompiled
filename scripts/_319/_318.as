package _319
{
   import _18.IAction;
   import _658._661;
   
   public class _318 extends _328
   {
      private var _3163:Vector.<IAction>;
      
      public function _318()
      {
         super();
         _2215 = true;
         _2219 = true;
         _2224 = true;
         this._3163 = new Vector.<IAction>();
      }
      
      override protected function _2211() : *
      {
         var _loc2_:Vector.<_661> = null;
         super._2211();
         var _loc1_:Vector.<_661> = new Vector.<_661>(4);
         _loc2_ = _2223.edge as Vector.<_661>;
         if(_loc2_)
         {
            _loc1_[0] = _loc2_[0];
            _loc1_[1] = vertex;
            _loc1_[2] = vertex;
            _loc1_[3] = _loc2_[1];
         }
         _2223.addEdge = _loc1_;
      }
      
      override public function merge(param1:IAction) : Boolean
      {
         if(param1 is _318)
         {
            this._3163.push(param1);
            return true;
         }
         if(param1 is _321)
         {
            this._3163.push(param1);
            return true;
         }
         return false;
      }
      
      override public function execute() : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         super.execute();
         if(mesh._2119())
         {
            mesh._3162(vertex,this._3169,false,_2223.addRig);
         }
         else
         {
            mesh._3167(vertex,this._3169,false);
         }
         var _loc1_:Vector.<_661> = _2223.edge as Vector.<_661>;
         var _loc2_:Vector.<_661> = _2223.addEdge as Vector.<_661>;
         if(Boolean(_loc1_) && Boolean(_loc2_))
         {
            if(_2223._3168)
            {
               mesh._3160(_loc1_[0],_loc1_[1],false);
               mesh._3166(_loc2_[0],_loc2_[1],false);
               mesh._3166(_loc2_[2],_loc2_[3],false);
            }
            else if(_2223.onUserEdge)
            {
               mesh._3159(_loc1_[0],_loc1_[1],false);
               mesh._3164(_loc2_[0],_loc2_[1],false);
               mesh._3164(_loc2_[2],_loc2_[3],false);
            }
         }
         mesh._3165();
         _2894();
         if(Boolean(this._3163) && Boolean(this._3163.length))
         {
            _loc3_ = 0;
            _loc4_ = int(this._3163.length);
            while(_loc3_ < _loc4_)
            {
               this._3163[_loc3_].redo();
               _loc3_++;
            }
         }
      }
      
      override public function revert() : void
      {
         var _loc3_:int = 0;
         super.revert();
         if(Boolean(this._3163) && Boolean(this._3163.length))
         {
            _loc3_ = int(this._3163.length - 1);
            while(_loc3_ >= 0)
            {
               this._3163[_loc3_].undo();
               _loc3_--;
            }
         }
         if(mesh._2119())
         {
            _2223.addRig = mesh._3158(vertex,this._3169,false);
         }
         else
         {
            mesh._3161(vertex,this._3169,false);
         }
         var _loc1_:Vector.<_661> = _2223.edge as Vector.<_661>;
         var _loc2_:Vector.<_661> = _2223.addEdge as Vector.<_661>;
         if(Boolean(_loc1_) && Boolean(_loc2_))
         {
            if(_2223._3168)
            {
               mesh._3160(_loc2_[0],_loc2_[1],false);
               mesh._3160(_loc2_[2],_loc2_[3],false);
               mesh._3166(_loc1_[0],_loc1_[1],false);
            }
            else if(_2223.onUserEdge)
            {
               mesh._3159(_loc2_[0],_loc2_[1],false);
               mesh._3159(_loc2_[2],_loc2_[3],false);
               mesh._3164(_loc1_[0],_loc1_[1],false);
            }
         }
         mesh._3165();
         _2894();
      }
      
      protected function get _3169() : _661
      {
         return _2223._3169 as _661;
      }
   }
}

