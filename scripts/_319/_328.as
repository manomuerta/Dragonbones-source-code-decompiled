package _319
{
   import _1404._1407;
   import _51._79;
   import _555._570;
   import _561._568;
   import _586._11505;
   import _658.Mesh;
   import _658._661;
   import _93._92;
   
   public class _328 extends _92
   {
      public function _328()
      {
         super();
      }
      
      protected function _2894() : void
      {
         this._3172._3173();
         this._11553._3173();
         if(this._1837)
         {
            _2212._2907(this._1837);
         }
         this._2853.refresh();
      }
      
      protected function get _1837() : _79
      {
         return _2223._1837 as _79;
      }
      
      protected function get mesh() : Mesh
      {
         return _2223.mesh as Mesh;
      }
      
      protected function get vertex() : _661
      {
         return _2223.vertex as _661;
      }
      
      protected function get vertices() : Vector.<_661>
      {
         return _2223.vertices as Vector.<_661>;
      }
      
      protected function get _3172() : _568
      {
         return _1407.getInstance(_568) as _568;
      }
      
      protected function get _11553() : _11505
      {
         return _1407.getInstance(_11505) as _11505;
      }
      
      protected function get _2853() : _570
      {
         return _1407.getInstance(_570) as _570;
      }
   }
}

